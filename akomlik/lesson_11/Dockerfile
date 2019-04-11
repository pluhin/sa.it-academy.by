FROM alpine:3.1

# Update
RUN apk add --update python py-pip

# Install app dependencies
RUN pip install Flask

# Bundle app source
<<<<<<< HEAD
COPY ./src/simpleapp.py /src/simpleapp.py
=======
COPY ./simpleapp.py /src/simpleapp.py
>>>>>>> d8bbd86981e6fb2b5c30019fd1be90470ff98777

EXPOSE  8000
CMD ["python", "/src/simpleapp.py", "-p 8000"]
