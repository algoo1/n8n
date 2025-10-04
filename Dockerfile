FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Install additional packages if needed
USER root
RUN apk add --no-cache curl

# Switch back to node user
USER node

# Create .n8n directory
RUN mkdir -p /home/node/.n8n

# Copy any custom configurations if needed
# COPY custom-config/ /home/node/.n8n/

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Expose port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Start n8n
CMD ["n8n", "start"]