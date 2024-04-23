FROM nginx:1.23.4

# Copy config files
RUN mkdir /confs
ADD ./nginx /confs/

# Copy flutter web files
ADD ./build/web /usr/share/nginx/html/

# Create app directory
RUN mkdir /app
COPY entrypoint.sh /app/entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/app/entrypoint.sh" ]
