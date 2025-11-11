# ------------------- Stage 1: Build Stage using python 3.9 base image ------------------------------
FROM python:3.9 AS builder

# Set the working directory in the container
WORKDIR /app

# Install required packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements and rest file into the container
COPY requirements.txt .

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# ------------------- Stage 2: Final Stage using python 3.9 slim image ------------------------------
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app


# Install runtime dependencies only
RUN apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3 && \
    rm -rf /var/lib/apt/lists/*

# Copy dependencies and application code from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY . .

CMD ["python", "app.py"]
