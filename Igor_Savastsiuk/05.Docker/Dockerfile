FROM debian:stretch-slim

RUN apt update \
    && apt install -y ruby linuxlogo

WORKDIR /tmp

COPY api_lis.rb /tmp

CMD ["ruby", "api_lis.rb"]

EXPOSE 8080

