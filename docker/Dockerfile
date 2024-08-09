FROM rstudio/r-base:4.3.2-jammy
# does not contain rstudio, just r-base installation
# is based on ubuntu:22.04

# install inkscape
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        inkscape \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/build

COPY worldmap-svg.R /var/build/worldmap-svg.R
COPY geocoding.py /var/build/geocoding.py
COPY process.sh /var/build/process.sh


# TODO add geopy python image

CMD ["/bin/bash"]
