#!groovy
import jenkins.model.*
import hudson.security.*
def instance = Jenkins.getInstance()
println "--> creating local user 'admin'"
password = System.getenv("PASS")
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount('admin',password)
instance.setSecurityRealm(hudsonRealm)
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(true)
instance.setAuthorizationStrategy(strategy)
instance.save()
