# Pull base image of jdk
FROM openjdk:17-jdk-alpine

# Create a directory
WORKDIR /app

# Copy source code to container
COPY . .

# Compile Application code
RUN javac src/Main.java

# Run the application using CMD which can be override
CMD ["java", "Main"]

# ENTRY point can't be override
# ENTRYPOINT ["java", "Main"]
