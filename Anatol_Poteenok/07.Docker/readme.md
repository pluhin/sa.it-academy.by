#Assignment 1: Docker Installation and Basic Commands

``
docker ps

	sudo snap install docker
    history
    docker --version
	   # Docker version 28.4.0, build d8eb465
	
    docker images
    docker run hello-word
    docker run hello-world
    docker ps -a
   
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
44754836e6d5   hello-world   "/hello"   4 minutes ago   Exited (0) 4 minutes ago             cool_fermat
	
```
	




```	
# Config create grete image builfer to build Rust app

FROM rust:1.88-slim

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    libpq-dev \
    g++ \
    git \
    curl \
    unzip \
    wget \
    ca-certificates \
    gcc \
    make \
    && rm -rf /var/lib/apt/lists/*

#   Swagger UI
RUN mkdir -p /usr/share/swagger-ui && \
    wget https://github.com/swagger-api/swagger-ui/archive/refs/tags/v5.17.12.zip -O /usr/share/swagger-ui/swagger-ui.zip


#  Env ( для распаковки при билде)
ENV SWAGGER_UI_DOWNLOAD_URL=file:///usr/share/swagger-ui/swagger-ui.zip

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]

```

command for build app under runned container

```
sudo docker exec -it mdm-builder /usr/local/bin/build_script.sh test-branch
```

# result build

```
...

warning: constant `API_V2_DEVICE` is never used
 --> crates/restserver/src/handlers_web/v2_device/devices.rs:6:11
  |
6 | pub const API_V2_DEVICE: &str = "/api/v2/device/";
  |           ^^^^^^^^^^^^^

warning: associated functions `upload_requests_total` and `download_requests_total` are never used
  --> crates/restserver/src/handlers_web/metrics.rs:20:12
   |
18 | impl FileMetrics {
   | ---------------- associated functions in this implementation
19 |     /// Counter для upload операций
20 |     pub fn upload_requests_total() -> &'static CounterVec {
   |            ^^^^^^^^^^^^^^^^^^^^^
...
32 |     pub fn download_requests_total() -> &'static CounterVec {
   |            ^^^^^^^^^^^^^^^^^^^^^^^

warning: function `metrics_export` is never used
   --> crates/restserver/src/handlers_web/metrics.rs:178:8
    |
178 | pub fn metrics_export() -> HttpResponse {
    |        ^^^^^^^^^^^^^^

warning: function `register_all_metrics` is never used
   --> crates/restserver/src/handlers_web/metrics.rs:193:8
    |
193 | pub fn register_all_metrics() {
    |        ^^^^^^^^^^^^^^^^^^^^

warning: variants `NotFound` and `SizeExceeded` are never constructed
  --> crates/restserver/src/handlers_web/multipart_utils.rs:97:5
   |
95 | pub enum FieldReadError {
   |          -------------- variants in this enum
96 |     /// Поле не найдено
97 |     NotFound(String),
   |     ^^^^^^^^
98 |     /// Размер превышен
99 |     SizeExceeded { field: String, size: usize, max: usize },
   |     ^^^^^^^^^^^^
   |
   = note: `FieldReadError` has a derived impl for the trait `Debug`, but this is intentionally ignored during dead code analysis

warning: function `read_field_as_option_string` is never used
   --> crates/restserver/src/handlers_web/multipart_utils.rs:135:14
    |
135 | pub async fn read_field_as_option_string(field: &mut Field) -> Result<Option<String>, FieldReadError> {
    |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: `restserver` (lib) generated 90 warnings (run `cargo fix --lib -p restserver` to apply 47 suggestions)
    Finished `release` profile [optimized] target(s) in 1.49s
Successfully copied restserver to apiserver-latest
Cargo.lock  Cross.toml  crates    docs   migrations   restserver_check.txt  target               test_apk_upload.py
Cargo.toml  README.md   diagrams  infra  resource.rc  scripts               test_apk_upload.ps1  test_extract_path.pdb
--- DONE: Branch test-branch built and deployed to artifacts ---

```