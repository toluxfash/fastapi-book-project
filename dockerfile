# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . .

# Install the Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the Nginx configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the port that FastAPI will run on (this is for uvicorn)
EXPOSE 80

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to our script
CMD ["./entrypoint.sh"]


