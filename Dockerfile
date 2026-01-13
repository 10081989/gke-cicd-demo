FROM nginx:alpine
COPY index.html /usr/share/nginx/html/

# ← ADD nginx 8080 config
RUN echo 'server { \
  listen 8080; \
  listen [::]:8080; \
  location / { \
    root /usr/share/nginx/html; \
    index index.html; \
  } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
