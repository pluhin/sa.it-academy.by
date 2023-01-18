import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def strategy = instance.getAuthorizationStrategy()
if (!(strategy instanceof GlobalMatrixAuthorizationStrategy)) {
  strategy = new GlobalMatrixAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)
      instance.save()
        instance.doSafeRestart()
	}
