## xml job configuration
```xml
<?xml version='1.1' encoding='UTF-8'?>
<flow-definition plugin="workflow-job@1540.v295eccc9778f">
  <actions>
    <org.jenkinsci.plugins.pipeline.modeldefinition.actions.DeclarativeJobAction plugin="pipeline-model-definition@2.2258.v4e96d2b_da_f9b_"/>
    <org.jenkinsci.plugins.pipeline.modeldefinition.actions.DeclarativeJobPropertyTrackerAction plugin="pipeline-model-definition@2.2258.v4e96d2b_da_f9b_">
      <jobProperties/>
      <triggers/>
      <parameters/>
      <options/>
    </org.jenkinsci.plugins.pipeline.modeldefinition.actions.DeclarativeJobPropertyTrackerAction>
  </actions>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <com.sonyericsson.rebuild.RebuildSettings plugin="rebuild@338.va_0a_b_50e29397">
      <autoRebuild>false</autoRebuild>
      <rebuildDisabled>false</rebuildDisabled>
    </com.sonyericsson.rebuild.RebuildSettings>
  </properties>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition" plugin="workflow-cps@4175.ve65b_fa_663eed">
    <script>pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name &apos;curl-test&apos;
        image &apos;pluhin31/wget_curl:latest&apos;
        ttyEnabled true
        command &apos;sleep 180&apos;
        }
  }
  }
  stages {
    stage(&apos;Test&apos;) {
      steps {
        container(&apos;curl-test&apos;) {
          sh &quot;&quot;&quot;#!/bin/sh
            MONTH=\$(date +&apos;%m&apos;)
            DAY=\$(date +&apos;%d&apos;)
            curl --version
            curl -G -d country=&quot;BY&quot; -d year=&quot;2024&quot; -d pretty -d day=\$DAY -d month=\$MONTH -d key=&quot;$holiday_key&quot; &quot;https://holidayapi.com/v1/holidays&quot;
            curl -s &quot;https://api.frankfurter.dev/v1/latest?base=USD&quot;
          &quot;&quot;&quot;
        }

      }
    }
  }
}</script>
    <sandbox>true</sandbox>
  </definition>
  <triggers/>
  <disabled>false</disabled>
</flow-definition>
```
