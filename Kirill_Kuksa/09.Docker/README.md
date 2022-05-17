### DOCKER Image
[kirilltd/listener:latest](kirilltd/listener:latest)

### API Check
```bash
kirill@kirills-MacBook-Pro 09.Docker % docker run -d -p 8899:8899 09b291a03e7b
07843f9e80789993773ff73637a14cb4a31050cdc92a555fd2d6656fe990d68d
kirill@kirills-MacBook-Pro 09.Docker % curl -d "hello" localhost:8899
Hello World
kirill@kirills-MacBook-Pro 09.Docker % curl -d "bye" localhost:8899
unknown command
```