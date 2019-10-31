# Docker file that installs docker container for Selprom
#
# build with: "docker build -t <image_name> ."

# Install basic image
FROM continuumio/miniconda3
#FROM continuumio/anaconda3:4.4.0

#### update
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y wget

RUN pip install cirpy pubchempy

RUN conda install -y -c anaconda setuptools \
 && conda update -y -n base -c defaults conda

#RUN pip install networkx cirpy pubchempy beautifulsoup4

# Install additional tools
RUN conda install -c conda-forge flask-restful=0.3.6 \
 && conda install -c sbmlteam python-libsbml \
 && conda install -c anaconda networkx \
 && conda install -c anaconda beautifulsoup4 \
 && conda install -c conda-forge xorg-libxrender \
 && conda install -c anaconda lxml \
 && conda install -c anaconda ipython \
 && conda install -c conda-forge py2cytoscape \
 && conda install -c rdkit rdkit


WORKDIR /home

COPY rpVisualiserServe.py .

# Start the server
ENTRYPOINT ["python"]
CMD ["/home/rpVisualiserServe.py"]

# Open server port
EXPOSE 8998
