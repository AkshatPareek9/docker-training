# Build the image using python3.9 base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install required packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements and rest file into the container
COPY . .

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Run you application
CMD ["python", "app.py"]
