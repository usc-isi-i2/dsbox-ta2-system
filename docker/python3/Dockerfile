FROM registry.datadrivendiscovery.org/jpl/docker_images/jpl_base_python3.5
MAINTAINER D3M

RUN apt-get install -y python3-dev libssl-dev

RUN \
pip3 install punk && \
pip3 install langdetect && \
pip3 install zerorpc && \
pip3 install stopit && \
pip3 install grpcio grpcio-tools && \
pip3 install librosa cvxpy h5py && \
pip3 install fancyimpute

EXPOSE 50051

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

# Change primitives unified interface to use python3
RUN \
sed -i.bak 's/primitive-interfaces\/python2/primitive-interfaces/' \
$TA2/dsbox_dev_setup.py

# Compile TA3-TA2 api protocol files
RUN python3 -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/core.proto
RUN python3 -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/data_ext.proto
RUN python3 -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/dataflow_ext.proto

# Make a soft link to the search executable
RUN chmod 755 $TA2/ta2-search
RUN ln -s $TA2/ta2-search /usr/bin/ta2_search

# Start the TA2 server
CMD python3 $TA2/server/ta2-server.py &
