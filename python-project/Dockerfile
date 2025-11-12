# Pull the python base image
FROM python:3.7

# Create a work directory
WORKDIR /app

# Copy the python code
COPY src/. .

# Install the required packages
RUN pip install -r requirements.txt

# Execute the python application
ENTRYPOINT ["python", "run.py"]

EXPOSE 80
