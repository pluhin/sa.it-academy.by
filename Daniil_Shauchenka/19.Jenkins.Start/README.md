```
jenkins@jenkins-c885d7b5f-dnpdq:~/jobs$ cat daily-info/
builds/          config.xml       nextBuildNumber  
jenkins@jenkins-c885d7b5f-dnpdq:~/jobs$ cat daily-info/config.xml 
<?xml version='1.1' encoding='UTF-8'?>
<project>
  <actions/>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <com.sonyericsson.rebuild.RebuildSettings plugin="rebuild@338.va_0a_b_50e29397">
      <autoRebuild>false</autoRebuild>
      <rebuildDisabled>false</rebuildDisabled>
    </com.sonyericsson.rebuild.RebuildSettings>
  </properties>
  <scm class="hudson.scm.NullSCM"/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers>
    <hudson.triggers.TimerTrigger>
      <spec>H H * * *</spec>
    </hudson.triggers.TimerTrigger>
  </triggers>
  <concurrentBuild>false</concurrentBuild>
  <builders>
    <hudson.tasks.Shell>
      <command>#!/bin/bash

echo &quot;DAILY INFORMATION&quot;
echo &quot;Date: $(date)&quot;

echo &quot;&quot;
echo &quot;Checking holidays&quot;
curl -s https://holidayapi.com/countries/by/2023 || echo &quot;Holiday API not available&quot;

echo &quot;&quot;
echo &quot;Exchange rates&quot;
curl -s https://www.nbrb.by/api/exrates/rates?periodicity=0 | head -20</command>
      <configuredLocalRules/>
    </hudson.tasks.Shell>
  </builders>
  <publishers/>
  <buildWrappers/>
```
