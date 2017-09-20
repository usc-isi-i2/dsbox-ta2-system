FROM registry.datadrivendiscovery.org/jpl/docker_images/jpl_base_python3.5
MAINTAINER D3M

RUN \
pip3 install punk && \
pip3 install langdetect && \
pip3 install zerorpc && \
pip3 install stopit

EXPOSE 8888

# Copy the TA2 code to the docker container
ENV CODE /dsbox
ENV TA2 $CODE/dsbox-ta2/python
COPY . $CODE

# PYTHON 3 changes
# Change environment from python to python3 in code
RUN \
sed -i.bak 's/env python/env python3/' \
$TA2/dsbox/executer/executionhelper.py \
$TA2/ta2-search \
$TA2/server/ta2-server.py \
$TA2/server/ta2-client.py

# Change primitives unified interface to use python3
RUN \
sed -i.bak 's/primitive-interfaces\/python2/primitive-interfaces/' \
$TA2/dsbox_dev_setup.py

# Make a soft link to the search executable 
RUN ln -s $TA2/ta2-search /usr/bin/ta2_search
