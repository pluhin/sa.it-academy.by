# 09 Docker


## Creating of Dockerfile

```bash
FROM alpine:latest

LABEL maintaner="estello2k@gmail.com"

RUN apk update \
    && apk add python3 --no-cache

COPY ./gen.py /

CMD ["python3", "./gen.py"]
```

## Creating of gen.py (since the port listener was "as example", I decided to use the simplest randomizer)

```bash
# The simplest python randomizer
import random

print(random.randint(0,9))
```

## Testing

```bash
vagrant@ubuntu-bionic:~/9docker$ docker run python:v1.0
2
```

## Link

https://github.com/users/Este11o/packages/container/package/gen

