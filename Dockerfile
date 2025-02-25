# Use the official Python 3.11 image as base
FROM python:3.11-buster

# Set working directory
WORKDIR /usr/src/app

# Set appropriate permissions for the working directory
RUN chmod 777 /usr/src/app

# Update package list and install necessary utilities
RUN apt -qq update && apt -qq install -y wget locales

# Copy requirements.txt to the working directory
COPY requirements.txt .

# Install dependencies from requirements.txt using pip3
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files to the working directory
COPY . .

# Generate locale settings
RUN locale-gen en_US.UTF-8

# Set environment variables for locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the default command to run start.sh script
CMD ["bash", "start.sh"]
