# Use PyTorch with CUDA and cuDNN as a parent image
FROM pytorch/pytorch:nightly-devel-cuda10.0-cudnn7

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install python3-venv
RUN apt-get update && apt-get install -y python3-venv

# Create a Python virtual environment
RUN python3 -m venv points python=3.9

# Activate the virtual environment and install the dependencies
RUN /bin/bash -c "source points/bin/activate && pip install --upgrade pip && pip install wheel && pip install -r requirements.txt && bash scripts/install_dependencies.sh"

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
# CMD ["python", "app.py"]

# CMD ["tail", "-f", "/dev/null"]
