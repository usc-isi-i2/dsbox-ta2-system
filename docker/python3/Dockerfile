
# FROM registry.datadrivendiscovery.org/jpl/docker_images/complete:ubuntu-xenial-python36-v2018.1.26
FROM registry.datadrivendiscovery.org/jpl/docker_images/complete:ubuntu-artful-python36-v2018.6.5

MAINTAINER D3M

RUN apt-get update
RUN apt-get -y install libssl-dev 
#python3-dev python3-setuptools
RUN apt-get -y install ffmpeg flac


RUN git clone https://gitlab.com/datadrivendiscovery/common-primitives && \
    cd common-primitives && \
    sed -i "s/# datasets.Denormalize/datasets.Denormalize/" entry_points.ini && \
    pip3 install -e .


RUN pip3 install --upgrade pip
RUN pip3 install punk
RUN pip3 install langdetect
RUN pip3 install zerorpc
RUN pip3 install stopit
RUN pip3 install grpcio grpcio-tools
RUN pip3 install librosa cvxpy h5py
RUN pip3 install fancyimpute
RUN pip3 install --install-option="--with-nss" pycurl
RUN pip3 install mypy
RUN pip3 install cython
RUN pip3 install deepdiff==3.3.0 docker[tls]==2.7 frozendict==1.2 pyyaml

# More python packages
RUN pip3 install pandas keras tensorflow
RUN pip3 install pillow
RUN pip3 install pslgraph networkx


EXPOSE 45042

# Hack for Keras not to download stuff
COPY keras /root/.keras
ADD https://github.com/fchollet/deep-learning-models/releases/download/v0.2/resnet50_weights_tf_dim_ordering_tf_kernels.h5 /root/.keras/models/
ADD https://github.com/fchollet/deep-learning-models/releases/download/v0.1/vgg16_weights_tf_dim_ordering_tf_kernels.h5 /root/.keras/models/

# Copy the TA2 code to the docker container
ENV CODE /dsbox
ENV TA2 $CODE/dsbox-ta2/python
ENV TA2API $CODE/ta3ta2-api
COPY . $CODE


# PYTHON 3 changes
# Change environment from python to python3 in code
RUN \
sed -i.bak 's/env python/env python3/' \
$TA2/dsbox/executer/executionhelper.py \
$TA2/ta2-search \
$TA2/server/ta2-server.py \
$TA2/server/ta2-client.py


# Make a soft link to the search executable
RUN chmod 755 $TA2/ta2-search
RUN ln -s $TA2/ta2-search /usr/bin/ta2_search

# Start the TA2 server
CMD python3 $TA2/server/ta2-server.py
