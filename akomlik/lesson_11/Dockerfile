FROM alpine

# Update
RUN apk add --update python py-pip

# Install app dependencies
RUN pip install Flask

# Bundle app source

COPY ./src/simpleapp.py /src/simpleapp.py


EXPOSE  8000
CMD ["python", "/src/simpleapp.py", "-p 8000"]
