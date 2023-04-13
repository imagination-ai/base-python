FROM python:3.11.3-slim-bullseye as base

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
       curl \
       procps \
       zip \
       libglib2.0-0 \
       libnss3 \
       libgconf-2-4 \
       curl \
       gnupg \
       libfontconfig1 

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update -y && apt-get install google-cloud-cli -y

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

# chromedriver
RUN wget https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_linux64.zip

RUN apt-get install -y zip

RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/chromedriver

