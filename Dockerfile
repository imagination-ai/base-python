FROM python:3.9-slim-bullseye as base

RUN apt-get update -y && \
    apt-get install -y \
       libblas-dev \
       liblapack-dev \
       libpng-dev \
       locales \
       libssl-dev \
       libffi-dev \
       libfreetype6-dev \
       vim \
       wget \
       zip \
       libglib2.0-0 \
       libnss3 \
       libgconf-2-4 \
       libfontconfig1 

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

# chromedriver
RUN wget https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip

RUN apt-get install -y zip

RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/chromedriver
