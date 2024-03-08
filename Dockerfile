# Use an official Python slim image as a parent image
FROM python:3.8-slim

# Install Chrome and ChromeDriver
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything from sec folder to the container's /app folder
COPY src/ .

# Run the command to start Selenium or your Python script
CMD ["python", "main.py"]
