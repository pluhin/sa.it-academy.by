def resolveBranch() {
    if (env.BRANCH_NAME) {
        return env.BRANCH_NAME
    }
    if (env.GIT_BRANCH) {
        return env.GIT_BRANCH.replaceFirst(/^origin\//, '')
    }

    def branch = sh(
            script: "git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown",
            returnStdout: true
    ).trim()

    return branch == 'HEAD' ? 'detached' : branch
}

def notifyStart(String user) {
    def branch = resolveBranch()

    withCredentials([
            string(credentialsId: 'telegram-bot-token', variable: 'BOT_TOKEN'),
            string(credentialsId: 'telegram-chat-id', variable: 'CHAT_ID')
    ]) {
        def response = sh(
                script: """
              curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
                -d chat_id="$CHAT_ID" \
                --data-urlencode text="🚀 *${env.JOB_NAME}*
Branch: *${branch}*
Started by: *${user}*
Build #${env.BUILD_NUMBER}
Status: *RUNNING* ⏳" \
                -d parse_mode=Markdown
            """,
                returnStdout: true
        ).trim()

        env.TG_MESSAGE_ID = sh(
                script: "echo '${response}' | sed -n 's/.*\"message_id\":\\([0-9]*\\).*/\\1/p'",
                returnStdout: true
        ).trim()
    }
}

def notifyFinish(String status, String user, long durationMs) {
    def branch = resolveBranch()
    long sec = durationMs.intdiv(1000)
    def duration = sec >= 60 ? "${sec.intdiv(60)}m ${sec % 60}s" : "${sec}s"

    withCredentials([
            string(credentialsId: 'telegram-bot-token', variable: 'BOT_TOKEN'),
            string(credentialsId: 'telegram-chat-id', variable: 'CHAT_ID')
    ]) {
        sh """
          curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d chat_id="$CHAT_ID" \
            --data-urlencode text="🚀 *${env.JOB_NAME}*
Branch: *${branch}*
Started by: *${user}*
Build #${env.BUILD_NUMBER}
Duration: *${duration}*
Status: *${status}*
${env.BUILD_URL}" \
            -d parse_mode=Markdown
        """
    }
}

def deleteStartMessage() {
    if (!env.TG_MESSAGE_ID) return

    withCredentials([
            string(credentialsId: 'telegram-bot-token', variable: 'BOT_TOKEN'),
            string(credentialsId: 'telegram-chat-id', variable: 'CHAT_ID')
    ]) {
        sh """
          curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/deleteMessage" \
            -d chat_id="$CHAT_ID" \
            -d message_id="$TG_MESSAGE_ID"
        """
    }
}

return this
