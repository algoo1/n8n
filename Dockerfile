FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Switch to node user
USER node

# Create .n8n directory
RUN mkdir -p /home/node/.n8n

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]