FROM pytorch/pytorch

MAINTAINER Gayathri Mahalingam <mahalingamg@uncw.edu>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cmake \
    python3-pip \
    nano vim \
    python-matplotlib \
    python-numpy \
    python-pil \
    python-scipy \
    build-essential \
    cython \
    python-pyqt5 \
    python-skimage && \
    pip install --no-cache-dir --upgrade pip setuptools \
	numpy \
	jupyter \
	Pillow \
	tifffile \
	opencv-python \
	scikit-image \
	scikit-learn \
	jupyter \
	natsort \
	pandas \
	h5py \
	tqdm \
	autopep8 \
	fire \
	argschema \
	tensorboardX \
	marshmallow

WORKDIR /root/gans

COPY ./. .

COPY jupyter_notebook_config.py /root/.jupyter/

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master
RUN jupyter contrib nbextension install --system
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable spellchecker/main

#RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8888

CMD ["/bin/bash"]
