FROM python:3

COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
RUN cp config.yaml.example config.yaml
ARG TOKEN=token
RUN sed -i "s|BOT_TOKEN_HERE|$TOKEN|g" config.yaml
CMD ./secretlounge-ng
