# Use the official Python 3.9 image as the base image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

COPY requirements.txt requirements.txt
# Copy the rest of the application code into the container at /ap	

RUN pip install -r requirements.txt

COPY . .

# Expose port 5000 to allow outside access to your application
EXPOSE 5000

# Define the command that will run when the container starts
CMD ["python3", "app.py" "--host=0.0.0.0"]
