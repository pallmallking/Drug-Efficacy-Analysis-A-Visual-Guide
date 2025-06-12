# Use an official Python runtime as a parent image
# Using the slim-buster version for a smaller image size
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install system-level dependencies that some Python packages might need
# Caching is disabled and temporary files are removed to keep the image small
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install Python libraries
# Using --no-cache-dir to reduce image size by not storing the download cache
RUN pip install --no-cache-dir pandas tensorflow numpy

# You can add commands to copy your application code into the container here
# For example:
# COPY . .

# Command to run when the container starts
# This will open an interactive python shell
CMD ["python"]
