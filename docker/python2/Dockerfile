FROM registry.datadrivendiscovery.org/jpl/docker_images/jpl_base_python2.7
MAINTAINER D3M

RUN \
pip install punk && \
pip install langdetect && \
pip install zerorpc && \
pip install stopit && \
pip install typing

EXPOSE 8888

# Copy the TA2 code to the docker container
ENV CODE /dsbox
ENV TA2 $CODE/dsbox-ta2/python
COPY . $CODE

# Make a soft link to the search executable 
RUN ln -s $TA2/ta2-search /usr/bin/ta2_search
