# Use the official Caddy image as a parent image
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav

# Use the official Caddy image to create the final image
FROM caddy:2

# Copy the custom Caddy build into the final image
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
