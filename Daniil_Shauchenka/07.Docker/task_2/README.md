```
CONTAINER ID   IMAGE         COMMAND               CREATED         STATUS         PORTS                                         NAMES
b5dc0a7939c5   docker-demo   "java -jar app.jar"   2 minutes ago   Up 2 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp   frosty_merkle

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::       (v4.0.0-SNAPSHOT)

2025-10-29T21:44:21.740Z  INFO 1 --- [demo] [           main] com.example.demo.DemoApplication         : Starting DemoApplication v0.0.1-SNAPSHOT using Java 21 with PID 1 (/app/app.jar started by root in /app)
2025-10-29T21:44:21.777Z  INFO 1 --- [demo] [           main] com.example.demo.DemoApplication         : No active profile set, falling back to 1 default profile: "default"
2025-10-29T21:44:24.684Z  INFO 1 --- [demo] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
2025-10-29T21:44:24.727Z  INFO 1 --- [demo] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2025-10-29T21:44:24.728Z  INFO 1 --- [demo] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.13]
2025-10-29T21:44:24.823Z  INFO 1 --- [demo] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 2716 ms
2025-10-29T21:44:25.989Z  INFO 1 --- [demo] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
2025-10-29T21:44:26.048Z  INFO 1 --- [demo] [           main] com.example.demo.DemoApplication         : Started DemoApplication in 5.785 seconds (process running for 7.696)
2025-10-29T21:44:56.467Z  INFO 1 --- [demo] [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
2025-10-29T21:44:56.468Z  INFO 1 --- [demo] [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
2025-10-29T21:44:56.471Z  INFO 1 --- [demo] [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 2 ms
curl http://localhost:8080/demo RESULT:
{"message":"this is demo"}
```
