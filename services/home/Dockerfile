FROM python:3.8.10-slim-buster

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

RUN pip install mkdocs

COPY ./src/ /docs/

WORKDIR /docs/

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
