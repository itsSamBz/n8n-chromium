FROM n8nio/n8n:latest

USER root

# Install Chromium and dependencies for Alpine Linux
RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto-emoji

# Set Puppeteer to use installed Chromium with no-sandbox
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Give chromium permissions
RUN chmod 4755 /usr/bin/chromium-browser || true

USER node

CMD ["n8n"]
