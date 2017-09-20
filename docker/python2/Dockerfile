FROM registry.datadrivendiscovery.org/jpl/docker_images/jpl_base_python2.7
MAINTAINER D3M

RUN apt-get install -y python-dev

RUN \
pip install punk && \
pip install langdetect && \
pip install zerorpc && \
pip install stopit && \
pip install typing && \
pip install grpcio grpcio-tools && \
pip install librosa cvxpy h5py

# TA2 Server port
EXPOSE 8888

# Copy the TA2 code to the docker container
ENV CODE /dsbox
ENV TA2 $CODE/dsbox-ta2/python
ENV TA2API $CODE/ta3ta2-api
COPY . $CODE

# Compile TA3-TA2 api protocol files
RUN python -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/core.proto
RUN python -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/data_ext.proto
RUN python -m grpc_tools.protoc -I $TA2API --python_out=$TA2API --grpc_python_out=$TA2API $TA2API/dataflow_ext.proto

# Make a soft link to the search executable
RUN ln -s $TA2/ta2-search /usr/bin/ta2_search

# Start the TA2 server
CMD $TA2/server/ta2-server.py
