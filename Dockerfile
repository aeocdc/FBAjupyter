# FBAjupyter enviroments
FROM python
MAINTAINER  yangyi@tib.cas.cn
#USER root
RUN wget --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
RUN /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
    /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r/ && \
    /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/mro/ && \
    /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
    /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ && \
    /opt/miniconda3/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
RUN mkdir /home/fba/
WORKDIR /home/fba
COPY enzyme_python.yml ./enzyme_python.yml
RUN /opt/miniconda3/bin/conda env create –file enzyme_python.yml
COPY cplex_studio128.linux-x86-64.bin ./cplex_studio128.linux-x86-64.bin
RUN ./cplex_studio128.linux-x86-64.bin
RUN vim  ~/.bashrc
RUN source ~/.bashrc
CMD jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root
