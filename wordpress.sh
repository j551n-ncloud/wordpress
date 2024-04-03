#!/bin/bash

# Function to generate SSL certificates
generate_ssl_certificates() {
    SSL_DIR="./ssl"
    PRIVATE_KEY="$SSL_DIR/private.key"
    CERTIFICATE="$SSL_DIR/certificate.crt"

    # Create SSL directory if it doesn't exist
    mkdir -p $SSL_DIR

    # Generate SSL certificate if not already present
    if [ ! -f "$PRIVATE_KEY" ] || [ ! -f "$CERTIFICATE" ]; then
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$PRIVATE_KEY" -out "$CERTIFICATE"
    fi
}

# Function to start containers using Docker Compose
start_containers() {
    docker-compose up -d
}

# Main function
main() {
    generate_ssl_certificates

    # Start containers using Docker Compose
    start_containers
}

# Execute main function
main
