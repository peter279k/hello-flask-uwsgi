# Install required packages
FROM alpine:3.8
RUN apk add --no-cache curl
RUN apk add --no-cache nginx
RUN apk add --no-cache git
RUN apk add --no-cache python3
RUN apk add --no-cache python3-dev
RUN apk add --no-cache openssl
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache openssh-client
RUN apk add --no-cache --virtual .pynacl_deps build-base libffi-dev
RUN apk add --no-cache libxml2
RUN apk add --no-cache libxml2-dev
RUN apk add --no-cache libxslt
RUN apk add --no-cache libxslt-dev
RUN apk add --no-cache alpine-sdk
RUN apk add --no-cache linux-headers
RUN pip3 install --no-cache-dir --upgrade pip
RUN rm -rf /var/cache/* && rm -rf /root/.cache/*

WORKDIR /var/www/localhost/htdocs
COPY app.py .
COPY requirements.txt .
RUN pip3 install -r requirements.txt

EXPOSE 80

# copy config files into filesystem
COPY nginx.conf /etc/nginx/nginx.conf
COPY app.ini /app.ini

# exectute start up script
CMD [ "sh", "-c", "nginx && uwsgi --ini /app.ini" ]
