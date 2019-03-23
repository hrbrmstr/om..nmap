# Example host distro
FROM alpine

# Install program using RUN lines
RUN apk add --no-cache \
    nmap \
    nmap-ncat \
    nmap-nping \
    nmap-nselibs \
    nmap-scripts

# outsider *requires* working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
