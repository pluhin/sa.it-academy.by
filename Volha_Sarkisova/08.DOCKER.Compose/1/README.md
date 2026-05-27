```bash
**Homework Assignment 1: Docker Compose for Application Stacks

** Структура проекта
1/
+-- docker-compose.yml
L-- web/
    +-- Dockerfile
    +-- app.py
    L-- requirements.txt
	

  687  docker compose up -d
  
			[+] up 2/2
			 ? Container my-database Running                                                                                    0.0s
			 ? Container my-web-app  Started
  
  688  docker compose ps
  
			NAME          IMAGE                COMMAND                  SERVICE    CREATED          STATUS          PORTS
			my-database   postgres:15-alpine   "docker-entrypoint.s…"   database   14 minutes ago   Up 14 minutes   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp
			my-web-app    1-web                "python app.py"          web        32 seconds ago   Up 22 seconds   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp
  
  689  docker compose logs
  
			my-web-app   |  * Serving Flask app 'app'
			my-database  |
			my-web-app   |  * Debug mode: off
			my-web-app   | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
			my-web-app   |  * Running on all addresses (0.0.0.0)
			my-web-app   |  * Running on http://127.0.0.1:5000
			my-web-app   |  * Running on http://172.18.0.3:5000
			my-web-app   | Press CTRL+C to quit
			my-database  | PostgreSQL Database directory appears to contain a database; Skipping initialization
			my-database  |
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  starting PostgreSQL 15.18 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  listening on IPv6 address "::", port 5432
			my-database  | 2026-05-26 09:02:50.370 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
			my-database  | 2026-05-26 09:02:50.395 UTC [29] LOG:  database system was shut down at 2026-05-26 09:02:34 UTC
			my-database  | 2026-05-26 09:02:50.409 UTC [1] LOG:  database system is ready to accept connections
			my-database  | 2026-05-26 09:07:50.495 UTC [27] LOG:  checkpoint starting: time
			my-database  | 2026-05-26 09:07:50.563 UTC [27] LOG:  checkpoint complete: wrote 3 buffers (0.0%); 0 WAL file(s) added, 0 removed, 0 recycled; wr
  
  690  docker compose logs web
  
			my-web-app  |  * Serving Flask app 'app'
			my-web-app  |  * Debug mode: off
			my-web-app  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
			my-web-app  |  * Running on all addresses (0.0.0.0)
			my-web-app  |  * Running on http://127.0.0.1:5000
			my-web-app  |  * Running on http://172.18.0.3:5000
			my-web-app  | Press CTRL+C to quit
			
  691  docker compose logs -f
  
			my-web-app   |  * Serving Flask app 'app'
			my-database  |
			my-web-app   |  * Debug mode: off
			my-web-app   | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
			my-web-app   |  * Running on all addresses (0.0.0.0)
			my-web-app   |  * Running on http://127.0.0.1:5000
			my-web-app   |  * Running on http://172.18.0.3:5000
			my-database  | PostgreSQL Database directory appears to contain a database; Skipping initialization
			my-web-app   | Press CTRL+C to quit
			my-database  |
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  starting PostgreSQL 15.18 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
			my-database  | 2026-05-26 09:02:50.344 UTC [1] LOG:  listening on IPv6 address "::", port 5432
			my-database  | 2026-05-26 09:02:50.370 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
			my-database  | 2026-05-26 09:02:50.395 UTC [29] LOG:  database system was shut down at 2026-05-26 09:02:34 UTC
			my-database  | 2026-05-26 09:02:50.409 UTC [1] LOG:  database system is ready to accept connections
			my-database  | 2026-05-26 09:07:50.495 UTC [27] LOG:  checkpoint starting: time
			my-database  | 2026-05-26 09:07:50.563 UTC [27] LOG:  checkpoint complete: wrote 3 buffers (0.0%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.021 s, sync=0.010 s, total=0.069 s; sync files=2, longest=0.005 s, average=0.005 s; distance=0 kB, estimate=0 kB
			
  692  curl http://localhost:5000
			
			{"message":"Hello from Docker Compose!","status":"running"}
			
  693  curl http://localhost:5000/db-test
			
			{"database":"DB: myapp. Server time: 2026-05-26 09:19:33.017593+00","status":"connected"}
			
			

  
```
