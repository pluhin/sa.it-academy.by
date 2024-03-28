credentials:
  system:
    domainCredentials:
    - credentials:
      - string:
          id: "slack"
          scope: GLOBAL
          secret: "{xxx}"
      - string:
          id: "slack1"
          scope: GLOBAL
          secret: "{xxx}"
      - string:
          id: "github"
          scope: GLOBAL
          secret: "{xxx}"
jenkins:
  agentProtocols:
  - "JNLP4-connect"
  - "Ping"
  authorizationStrategy:
    globalMatrix:
      entries:
      - user:
          name: "admin"
          permissions:
          - "Overall/Administer"
      - user:
          name: "user1"
          permissions:
          - "Job/Read"
  crumbIssuer:
    standard:
      excludeClientIPFromCrumb: false
  disableRememberMe: false
  disabledAdministrativeMonitors:
  - "hudson.util.DoubleLaunchChecker"
  labelAtoms:
  - name: "built-in"
  markupFormatter: "plainText"
  mode: NORMAL
  myViewsTabBar: "standard"
  nodeMonitors:
  - "architecture"
  - "clock"
  - diskSpace:
      freeSpaceThreshold: "1GiB"
      freeSpaceWarningThreshold: "2GiB"
  - "swapSpace"
  - tmpSpace:
      freeSpaceThreshold: "1GiB"
      freeSpaceWarningThreshold: "2GiB"
  - "responseTime"
  numExecutors: 2
  primaryView:
    all:
      name: "all"
  projectNamingStrategy: "standard"
  quietPeriod: 5
  remotingSecurity:
    enabled: true
  scmCheckoutRetryCount: 0
  securityRealm:
    local:
      allowsSignup: false
      enableCaptcha: false
      users:
      - id: "admin"
        name: "admin"
        properties:
        - "consoleUrlProvider"
        - "myView"
        - preferredProvider:
            providerId: "default"
        - "theme"
        - "timezone"
        - "experimentalFlags"
        - mailer:
            emailAddress: "admin@mail.com"
        - "apiToken"
        - "slack"
      - id: "user1"
        name: "user1"
        properties:
        - "apiToken"
        - "consoleUrlProvider"
        - "myView"
        - preferredProvider:
            providerId: "default"
        - "slack"
        - "theme"
        - "timezone"
        - "experimentalFlags"
        - mailer:
            emailAddress: "user1@mail.com"
  slaveAgentPort: -1
  updateCenter:
    sites:
    - id: "default"
      url: "https://updates.jenkins.io/update-center.json"
  views:
  - all:
      name: "all"
  viewsTabBar: "standard"
globalCredentialsConfiguration:
  configuration:
    providerFilter: "none"
    typeFilter: "none"
appearance:
  prism:
    theme: PRISM
  themeManager:
    disableUserThemes: false
security:
  apiToken:
    creationOfLegacyTokenEnabled: false
    tokenGenerationOnCreationEnabled: false
    usageStatisticsEnabled: true
  copyartifact:
    mode: PRODUCTION
  gitHooks:
    allowedOnAgents: false
    allowedOnController: false
  gitHostKeyVerificationConfiguration:
    sshHostKeyVerificationStrategy: "knownHostsFileVerificationStrategy"
  globalJobDslSecurityConfiguration:
    useScriptSecurity: true
  sSHD:
    port: -1
  scriptApproval:
    approvedScriptHashes:
    - "xxx"
    = "xxx"
    ...
    = "xxx"
unclassified:
  buildDiscarders:
    configuredBuildDiscarders:
    - "jobBuildDiscarder"
  buildStepOperation:
    enabled: false
  email-ext:
    adminRequiredForTemplateTesting: false
    allowUnregisteredEnabled: false
    charset: "UTF-8"
    debugMode: false
    defaultBody: |-
      $PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:

      Check console output at $BUILD_URL to view the results.
    defaultContentType: "text/plain"
    defaultSubject: "$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!"
    defaultTriggerIds:
    - "hudson.plugins.emailext.plugins.trigger.FailureTrigger"
    maxAttachmentSize: -1
    maxAttachmentSizeMb: -1
    precedenceBulk: false
    watchingEnabled: false
  enrichedSummaryConfig:
    enrichedSummaryEnabled: false
    httpClientDelayBetweenRetriesInSeconds: 1
    httpClientMaxRetries: 3
    httpClientTimeoutInSeconds: 1
  fingerprints:
    fingerprintCleanupDisabled: false
    storage: "file"
  gitHubConfiguration:
    apiRateLimitChecker: ThrottleForNormalize
  gitHubPluginConfig:
    configs:
    - credentialsId: "github"
      manageHooks: false
      name: "github"
    hookUrl: "http://192.168.100.189:8080/github-webhook/"
  globalTimeOutConfiguration:
    operations:
    - "abortOperation"
    overwriteable: false
  injectionConfig:
    allowUntrusted: false
    checkForBuildAgentErrors: false
    enabled: false
    enforceUrl: false
    injectCcudExtension: false
    injectMavenExtension: false
  junitTestResultStorage:
    storage: "file"
  location:
    adminAddress: "адрес еще не настроен <nobody@nowhere>"
    url: "http://192.168.100.189:8080/"
  mailer:
    charset: "UTF-8"
    useSsl: false
    useTls: false
  pollSCM:
    pollingThreadCount: 10
  scmGit:
    addGitTagAction: false
    allowSecondFetch: false
    createAccountBasedOnEmail: false
    disableGitToolChooser: false
    globalConfigEmail: "xxx"
    globalConfigName: "xxx"
    hideCredentials: false
    showEntireCommitSummaryInChanges: false
    useExistingAccountWithSameEmail: false
  slackNotifier:
    botUser: false
    room: "tests"
    sendAsText: false
    teamDomain: "xxx"
    tokenCredentialId: "slack1"
  timestamper:
    allPipelines: false
    elapsedTimeFormat: "'<b>'HH:mm:ss.S'</b> '"
    systemTimeFormat: "'<b>'HH:mm:ss'</b> '"
  upstream:
    globalUpstreamFilterStrategy: UseOldest
tool:
  git:
    installations:
    - home: "git"
      name: "Default"
  mavenGlobalConfig:
    globalSettingsProvider: "standard"
    settingsProvider: "standard"
jobs:
  - script: >
      job('Seed All') {
        scm {
          git ('https://github.com/ussnorma/seed.git')
        }
        steps {
          dsl {
           external('jobs/*.groovy')  
           // default behavior
           // removeAction('IGNORE')      
           removeAction('DELETE')
          }
        }
      }