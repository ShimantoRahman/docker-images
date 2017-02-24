FROM continuumio/anaconda3

RUN ["chmod", "711", "/mnt"]

RUN ["useradd", "-m", "runner"]

USER runner
RUN ["mkdir", "/home/runner/workdir"]
USER root

RUN ["pip", "install", "pylint"]
RUN ["pip", "install", "jsonschema"]
RUN ["pip", "install", "pyshp"]

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "emboss"]
RUN ["apt-get", "-y", "install", "gcc"]
RUN ["pip", "install", "biopython"]

RUN ["fc-cache", "-f"]

WORKDIR /home/runner/workdir
COPY main.sh /main.sh
COPY logger.sh /logger.sh
