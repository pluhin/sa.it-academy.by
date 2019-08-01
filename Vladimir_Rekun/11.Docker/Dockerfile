FROM alpine:3.1

# Update
RUN apk add --update python py-pip

# Install app dependencies
RUN pip install Flask

# Bundle app source
COPY d_app.py /opt/d_app.py

EXPOSE  8000
CMD ["python", "/opt/d_app.py", "-p 8000"]
