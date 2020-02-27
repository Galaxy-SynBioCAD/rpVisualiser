FROM brsynth/rprest:dev

RUN conda install -y -c rdkit rdkit=2019.03.1.0
RUN conda install -y -c bioconda python-libsbml
RUN conda install -y -c bioconda pubchempy
RUN conda install -y -c conda-forge lxml
RUN conda install -y -c conda-forge requests
RUN conda install -y -c conda-forge cirpy
RUN conda install -y -c conda-forge networkx
RUN conda install -y -c conda-forge beautifulsoup4
RUN conda install -y -c conda-forge matplotlib

COPY rpviz /home/rpviz

RUN apt-get install -y libxrender1
RUN pip install opencv-python
RUN apt update && apt install -y libsm6 libxext6
#RUN apt-get install -y libsm6 libxrender1 libfontconfig1
