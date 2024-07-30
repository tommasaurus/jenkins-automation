# Use the Jenkins inbound agent base image
FROM jenkins/inbound-agent:latest

# Set the user to root for installation purposes
USER root

# Install Git and other required packages
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

# Switch back to the Jenkins user
USER jenkins