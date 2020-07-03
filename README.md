# Nginx-Proxy

Use this when self-hosting a web server running multiple Docker containers, one for each web service.

This Docker Compose configuration will run a central Nginx server on ports 80 and 443 that will proxy to the other Docker containers on the same host.

It can also automatically generate LetsEncrypt certificates.

## Set Up

Get the latest template:

    curl https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > nginx.tmpl
    
Create a www network:

    docker network create www

## Self-Signed Certificates (development)

    HOST=example.com ./generate-self-signed-cert.sh

## Run It

### Development

With self-signed certificates (in `cert` directory):

    docker-compose up -d

### Production

With automatically generated LetsEncrypt certificates:

    docker-compose -f docker-compose.yml -f docker-compose-letsencrypt.yml up -d

## Notes

Add this variable to the environment (or .env file) of other Docker containers on the same host:

    VIRTUAL_HOST=example.com

Production:

    LETSENCRYPT_HOST=example.com

Optional:

    HTTPS_METHOD=noredirect

## Background Reading

https://github.com/nginx-proxy/nginx-proxy/blob/master/README.md

https://github.com/nginx-proxy/nginx-proxy/blob/master/docker-compose-separate-containers.yml

https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion/blob/master/README.md

https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion/blob/master/docs/Advanced-usage.md

https://github.com/jwilder/docker-gen/issues/77

https://devcenter.heroku.com/articles/ssl-certificate-self
