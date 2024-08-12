# use a base image with Ubuntu
FROM ubuntu:20.04

# set environment variables to non-interactive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV R_HOME=/usr/lib/R
ENV INKSCAPE_HOME=/usr/bin/inkscape

# install required packages and dependencies
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python3 \
    python3-pip \
    r-base \
    && apt-get clean

# create symlink for `python` to point to `python3`
RUN ln -s /usr/bin/python3 /usr/bin/python
 

# install Python packages
RUN pip3 install --no-cache-dir \
    geopy 


#install Inkscape
RUN add-apt-repository ppa:inkscape.dev/stable -y && \
    apt-get update && \
    apt-get install -y inkscape
     
# install R packages
RUN R -e "install.packages(c('maps', 'mapproj', 'mapdata'), repos='https://cloud.r-project.org/')"

# set working directory
WORKDIR /var/build

# copy necessary files into the Docker image
COPY collaborators-worldmap/scripts/worldmap-svg.R /var/build/worldmap-svg.R
COPY collaborators-worldmap/scripts/geocoding.py /var/build/geocoding.py
COPY collaborators-worldmap/scripts/process.sh /var/build/process.sh
COPY collaborators-worldmap/target /var/build/target
COPY reporting /var/build/reporting

# make sure the script is executable
RUN chmod +x /var/build/process.sh
RUN chmod +x /var/build/target

# set the entrypoint to run the script
ENTRYPOINT ["/var/build/process.sh"]