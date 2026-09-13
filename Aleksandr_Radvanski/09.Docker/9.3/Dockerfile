#  Сборка приложения (Builder)
FROM golang:1.21-alpine AS builder

# Установка необходимых инструментов для сборки
RUN apk add --no-cache git ca-certificates && update-ca-certificates

# Установка рабочей директории
WORKDIR /app

#  Копирование файлов зависимостей
COPY go.mod ./
# Загрузка файла модуля
RUN go mod download

#  Копирование исходного кода
COPY . .

# Статическая компиляция бинарного файла для Linux (без внешних зависимостей CGO)
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app/webserver .

#  Пустой образ Docker размером 0 байт.
FROM scratch

#  Копирование скомпилированного бинарного файла из этапа 'builder'
COPY --from=builder /app/webserver /webserver

# Ограничение прав
USER 1000:1000

# Открытие порта приложения
EXPOSE 8080

# Запуска приложения
ENTRYPOINT ["/webserver"]
