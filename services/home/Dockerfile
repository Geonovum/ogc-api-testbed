# Builder
FROM python:3.12-slim-bullseye as build-stage

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

COPY ./docs/ /docs/

RUN cd /docs && pip install mkdocs && mkdir /var/www && mkdocs build -d /var/www

# Deployer
FROM nginx:stable-alpine as production-stage
LABEL maintainer="Just van den Broecke <justb4@gmail.com>"
COPY --from=build-stage /var/www /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
