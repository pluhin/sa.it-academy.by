# 07.Docker

## Created Dockerfile of Java Spring Boot application (spring-3.0.0.jar in the folder target).

```bash
# base image to build a JRE
FROM amazoncorretto:17.0.3-alpine as corretto-jdk

# required for strip-debug to work
RUN apk add --no-cache binutils

# Build small JRE image
RUN $JAVA_HOME/bin/jlink \
         --verbose \
         --add-modules ALL-MODULE-PATH \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /customjre

# main app image
FROM alpine:latest
ENV JAVA_HOME=/jre
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# copy JRE from the base image
COPY --from=corretto-jdk /customjre $JAVA_HOME

# Add app user
ARG APPLICATION_USER=appuser
RUN adduser --no-create-home -u 1000 -D $APPLICATION_USER

# Configure working directory
RUN mkdir /app && \
    chown -R $APPLICATION_USER /app

USER 1000

ARG JAR_FILE=target/spring-3.0.0.jar
COPY --chown=1000:1000 ${JAR_FILE} /app/app.jar
WORKDIR /app

EXPOSE 8080
ENTRYPOINT [ "/jre/bin/java", "-jar", "/app/app.jar" ]

```
## Build an image.

```bash
 docker build --network=host -t spring .
Sending build context to Docker daemon  18.49MB
Step 1/16 : FROM amazoncorretto:17.0.3-alpine as corretto-jdk
 ---> 542966b432a4
Step 2/16 : RUN apk add --no-cache binutils
 ---> Running in 5813efd89fc9
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
fetch https://apk.corretto.aws/x86_64/APKINDEX.tar.gz
(1/3) Installing libgcc (10.3.1_git20211027-r0)
(2/3) Installing libstdc++ (10.3.1_git20211027-r0)
(3/3) Installing binutils (2.37-r3)
Executing busybox-1.34.1-r5.trigger
OK: 330 MiB in 19 packages
Removing intermediate container 5813efd89fc9
 ---> dcb96945bb58
Step 3/16 : RUN $JAVA_HOME/bin/jlink          --verbose          --add-modules ALL-MODULE-PATH          --strip-debug          --no-man-pages          --no-header-files          --compress=2          --output /customjre
 ---> Running in 85bfaa5be8eb
java.base file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.base.jmod
java.compiler file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.compiler.jmod
java.datatransfer file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.datatransfer.jmod
java.desktop file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.desktop.jmod
java.instrument file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.instrument.jmod
java.logging file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.logging.jmod
java.management file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.management.jmod
java.management.rmi file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.management.rmi.jmod
java.naming file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.naming.jmod
java.net.http file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.net.http.jmod
java.prefs file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.prefs.jmod
java.rmi file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.rmi.jmod
java.scripting file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.scripting.jmod
java.se file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.se.jmod
java.security.jgss file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.security.jgss.jmod
java.security.sasl file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.security.sasl.jmod
java.smartcardio file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.smartcardio.jmod
java.sql file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.sql.jmod
java.sql.rowset file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.sql.rowset.jmod
java.transaction.xa file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.transaction.xa.jmod
java.xml file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.xml.jmod
java.xml.crypto file:///usr/lib/jvm/java-17-amazon-corretto/jmods/java.xml.crypto.jmod
jdk.accessibility file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.accessibility.jmod
jdk.attach file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.attach.jmod
jdk.charsets file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.charsets.jmod
jdk.compiler file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.compiler.jmod
jdk.crypto.cryptoki file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.crypto.cryptoki.jmod
jdk.crypto.ec file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.crypto.ec.jmod
jdk.dynalink file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.dynalink.jmod
jdk.editpad file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.editpad.jmod
jdk.hotspot.agent file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.hotspot.agent.jmod
jdk.httpserver file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.httpserver.jmod
jdk.incubator.foreign file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.incubator.foreign.jmod
jdk.incubator.vector file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.incubator.vector.jmod
jdk.internal.ed file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.ed.jmod
jdk.internal.jvmstat file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.jvmstat.jmod
jdk.internal.le file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.le.jmod
jdk.internal.opt file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.opt.jmod
jdk.internal.vm.ci file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.vm.ci.jmod
jdk.internal.vm.compiler file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.vm.compiler.jmod
jdk.internal.vm.compiler.management file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.internal.vm.compiler.management.jmod
jdk.jartool file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jartool.jmod
jdk.javadoc file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.javadoc.jmod
jdk.jcmd file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jcmd.jmod
jdk.jconsole file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jconsole.jmod
jdk.jdeps file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jdeps.jmod
jdk.jdi file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jdi.jmod
jdk.jdwp.agent file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jdwp.agent.jmod
jdk.jfr file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jfr.jmod
jdk.jlink file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jlink.jmod
jdk.jpackage file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jpackage.jmod
jdk.jshell file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jshell.jmod
jdk.jsobject file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jsobject.jmod
jdk.jstatd file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.jstatd.jmod
jdk.localedata file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.localedata.jmod
jdk.management file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.management.jmod
jdk.management.agent file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.management.agent.jmod
jdk.management.jfr file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.management.jfr.jmod
jdk.naming.dns file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.naming.dns.jmod
jdk.naming.rmi file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.naming.rmi.jmod
jdk.net file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.net.jmod
jdk.nio.mapmode file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.nio.mapmode.jmod
jdk.random file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.random.jmod
jdk.sctp file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.sctp.jmod
jdk.security.auth file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.security.auth.jmod
jdk.security.jgss file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.security.jgss.jmod
jdk.unsupported file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.unsupported.jmod
jdk.unsupported.desktop file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.unsupported.desktop.jmod
jdk.xml.dom file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.xml.dom.jmod
jdk.zipfs file:///usr/lib/jvm/java-17-amazon-corretto/jmods/jdk.zipfs.jmod

Providers:
  jdk.jdi provides com.sun.jdi.connect.Connector used by jdk.jdi
  jdk.attach provides com.sun.tools.attach.spi.AttachProvider used by jdk.attach
  jdk.javadoc provides com.sun.tools.doclint.DocLint used by jdk.compiler
  jdk.compiler provides com.sun.tools.javac.platform.PlatformProvider used by jdk.compiler
  java.desktop provides java.net.ContentHandlerFactory used by java.base
  jdk.charsets provides java.nio.charset.spi.CharsetProvider used by java.base
  java.base provides java.nio.file.spi.FileSystemProvider used by java.base
  jdk.zipfs provides java.nio.file.spi.FileSystemProvider used by java.base
  java.naming provides java.security.Provider used by java.base
  java.security.jgss provides java.security.Provider used by java.base
  java.security.sasl provides java.security.Provider used by java.base
  java.smartcardio provides java.security.Provider used by java.base
  java.xml.crypto provides java.security.Provider used by java.base
  jdk.crypto.cryptoki provides java.security.Provider used by java.base
  jdk.crypto.ec provides java.security.Provider used by java.base
  jdk.security.jgss provides java.security.Provider used by java.base
  java.base provides java.util.random.RandomGenerator used by java.base
  jdk.random provides java.util.random.RandomGenerator used by java.base
  jdk.compiler provides java.util.spi.ToolProvider used by java.base
  jdk.jartool provides java.util.spi.ToolProvider used by java.base
  jdk.javadoc provides java.util.spi.ToolProvider used by java.base
  jdk.jdeps provides java.util.spi.ToolProvider used by java.base
  jdk.jlink provides java.util.spi.ToolProvider used by java.base
  jdk.jpackage provides java.util.spi.ToolProvider used by java.base
  java.management.rmi provides javax.management.remote.JMXConnectorProvider used by java.management
  java.management.rmi provides javax.management.remote.JMXConnectorServerProvider used by java.management
  jdk.naming.dns provides javax.naming.spi.InitialContextFactory used by java.naming
  jdk.naming.rmi provides javax.naming.spi.InitialContextFactory used by java.naming
  java.desktop provides javax.print.PrintServiceLookup used by java.desktop
  java.desktop provides javax.print.StreamPrintServiceFactory used by java.desktop
  java.management provides javax.security.auth.spi.LoginModule used by java.base
  jdk.security.auth provides javax.security.auth.spi.LoginModule used by java.base
  java.desktop provides javax.sound.midi.spi.MidiDeviceProvider used by java.desktop
  java.desktop provides javax.sound.midi.spi.MidiFileReader used by java.desktop
  java.desktop provides javax.sound.midi.spi.MidiFileWriter used by java.desktop
  java.desktop provides javax.sound.midi.spi.SoundbankReader used by java.desktop
  java.desktop provides javax.sound.sampled.spi.AudioFileReader used by java.desktop
  java.desktop provides javax.sound.sampled.spi.AudioFileWriter used by java.desktop
  java.desktop provides javax.sound.sampled.spi.FormatConversionProvider used by java.desktop
  java.desktop provides javax.sound.sampled.spi.MixerProvider used by java.desktop
  jdk.javadoc provides javax.tools.DocumentationTool used by java.compiler
  jdk.compiler provides javax.tools.JavaCompiler used by java.compiler
  jdk.compiler provides javax.tools.Tool not used by any observable module
  jdk.javadoc provides javax.tools.Tool not used by any observable module
  jdk.jshell provides javax.tools.Tool not used by any observable module
  jdk.editpad provides jdk.internal.editor.spi.BuildInEditorProvider used by jdk.jshell
  java.logging provides jdk.internal.logger.DefaultLoggerFinder used by java.base
  jdk.jpackage provides jdk.jpackage.internal.Bundler used by jdk.jpackage
  jdk.jpackage provides jdk.jpackage.internal.Bundlers used by jdk.jpackage
  jdk.jshell provides jdk.jshell.spi.ExecutionControlProvider used by jdk.jshell
  jdk.jlink provides jdk.tools.jlink.plugin.Plugin used by jdk.jlink
  jdk.internal.vm.ci provides jdk.vm.ci.hotspot.HotSpotJVMCIBackendFactory used by jdk.internal.vm.ci
  java.desktop provides sun.datatransfer.DesktopDatatransferService used by java.datatransfer
  jdk.internal.jvmstat provides sun.jvmstat.monitor.MonitoredHostService used by jdk.internal.jvmstat
  jdk.jstatd provides sun.jvmstat.monitor.MonitoredHostService used by jdk.internal.jvmstat
  jdk.management provides sun.management.spi.PlatformMBeanProvider used by java.management
  jdk.management.jfr provides sun.management.spi.PlatformMBeanProvider used by java.management
  jdk.unsupported.desktop provides sun.swing.InteropProvider used by java.desktop
  jdk.localedata provides sun.util.locale.provider.LocaleDataMetaInfo used by java.base
  jdk.localedata provides sun.util.resources.LocaleData$CommonResourceBundleProvider used by java.base
  jdk.localedata provides sun.util.resources.LocaleData$SupplementaryResourceBundleProvider used by java.base
WARNING: Using incubator modules: jdk.incubator.foreign, jdk.incubator.vector
Removing intermediate container 85bfaa5be8eb
 ---> 8cf199aa8be4
Step 4/16 : FROM alpine:latest
latest: Pulling from library/alpine
c158987b0551: Pull complete
Digest: sha256:8914eb54f968791faf6a8638949e480fef81e697984fba772b3976835194c6d4
Status: Downloaded newer image for alpine:latest
 ---> 49176f190c7e
Step 5/16 : ENV JAVA_HOME=/jre
 ---> Running in 4ffa7ace003d
Removing intermediate container 4ffa7ace003d
 ---> e47ebb1a9616
Step 6/16 : ENV PATH="${JAVA_HOME}/bin:${PATH}"
 ---> Running in fa1402c5ce9f
Removing intermediate container fa1402c5ce9f
 ---> 4ac9c04c497b
Step 7/16 : COPY --from=corretto-jdk /customjre $JAVA_HOME
 ---> 392736c29f1c
Step 8/16 : ARG APPLICATION_USER=appuser
 ---> Running in 5987d57fb0ba
Removing intermediate container 5987d57fb0ba
 ---> 599874f44f43
Step 9/16 : RUN adduser --no-create-home -u 1000 -D $APPLICATION_USER
 ---> Running in 1881b3b23634
Removing intermediate container 1881b3b23634
 ---> 456a13dd9845
Step 10/16 : RUN mkdir /app &&     chown -R $APPLICATION_USER /app
 ---> Running in 4b52f257361a
Removing intermediate container 4b52f257361a
 ---> ace5ba1617aa
Step 11/16 : USER 1000
 ---> Running in bfde66566bc2
Removing intermediate container bfde66566bc2
 ---> aa102a47ed1e
Step 12/16 : ARG JAR_FILE=target/spring-3.0.0.jar
 ---> Running in c466a084a0a8
Removing intermediate container c466a084a0a8
 ---> 70324576aad0
Step 13/16 : COPY --chown=1000:1000 ${JAR_FILE} /app/app.jar
 ---> a15cd65032a7
Step 14/16 : WORKDIR /app
 ---> Running in ce8909d7444e
Removing intermediate container ce8909d7444e
 ---> e49ba4d0b8ad
Step 15/16 : EXPOSE 8080
 ---> Running in b774bf02f94c
Removing intermediate container b774bf02f94c
 ---> 547c74d70089
Step 16/16 : ENTRYPOINT [ "/jre/bin/java", "-jar", "/app/app.jar" ]
 ---> Running in fc68af5a1f5a
Removing intermediate container fc68af5a1f5a
 ---> 3bfb1aa078d5
Successfully built 3bfb1aa078d5
Successfully tagged spring:latest

```
## Check size.

```bash
artem@serverart:~/sa.it-academy.by/Artyom_Borisevich/07.Docker$ docker images
REPOSITORY       TAG             IMAGE ID       CREATED          SIZE
spring           latest          3bfb1aa078d5   27 minutes ago   115MB
alpine           latest          49176f190c7e   13 days ago      7.05MB
amazoncorretto   17.0.3-alpine   542966b432a4   7 months ago     333MB
hello-world      latest          feb5d9fea6a5   14 months ago    13.3kB
```

## Run image as container and test it.

```bash
artem@serverart:~/07.Docker/spring-boot-docker$  docker run -p 8080:8080 -t spring -d

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.0.0)

2022-12-06T09:56:45.440Z  INFO 1 --- [           main] c.e.s.SpringBootDockerApplication        : Starting SpringBootDockerApplication v3.0.0 using Java 17.0.3 with PID 1 (/app/app.jar started by appuser in /app)
2022-12-06T09:56:45.467Z  INFO 1 --- [           main] c.e.s.SpringBootDockerApplication        : No active profile set, falling back to 1 default profile: "default"
2022-12-06T09:56:48.027Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2022-12-06T09:56:48.057Z  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2022-12-06T09:56:48.059Z  INFO 1 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.1]
2022-12-06T09:56:48.252Z  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2022-12-06T09:56:48.266Z  INFO 1 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 2450 ms
2022-12-06T09:56:49.148Z  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2022-12-06T09:56:49.201Z  INFO 1 --- [           main] c.e.s.SpringBootDockerApplication        : Started SpringBootDockerApplication in 5.202 seconds (process running for 6.148)

artem@serverart:~/07.Docker/spring-boot-docker$ docker run -d -p 8080:8080 -t spring
d8eeb1fe2964be3eebadd200fbbd19a04a63f96a4a84115f287f24c3fd9f9931

artem@serverart:~/07.Docker/spring-boot-docker$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                       NAMES
d8eeb1fe2964   spring    "/jre/bin/java -jar …"   8 seconds ago   Up 5 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   nice_pike

artem@serverart:~/07.Docker/spring-boot-docker$ curl --request GET \
--url http://localhost:8080
This is an effort to create slim version of java app by Borisevich.A.
```
