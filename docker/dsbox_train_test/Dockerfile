FROM registry.datadrivendiscovery.org/jpl/docker_images/complete:ubuntu-artful-python36-v2018.7.10-20180801-215033

RUN mkdir -p /user_opt
RUN mkdir -p /output
RUN mkdir -p /input

ENV CODE /user_opt/dsbox
ENV TA2 $CODE/dsbox-ta2/python

RUN pip3 install --upgrade pip

RUN mkdir $CODE

RUN cd $CODE && pip3 install -e git+https://gitlab.com/datadrivendiscovery/sklearn-wrap@9346c271559fd221dea4bc99c352ce10e518759c#egg=sklearn-wrap
RUN cd $CODE && pip3 install -e git+https://gitlab.com/datadrivendiscovery/common-primitives@fa865a1babc190055cb2a17cbdcd5b37e6f5e774#egg=common-primitives

RUN cd $CODE \
&& git clone https://github.com/usc-isi-i2/dsbox-ta2.git \
&& cd dsbox-ta2 \
&& git checkout a8f0a75e0aa3967eda7d34235003dc1811342376


RUN \
sed -i.bak 's/env python/env python3/' \
$TA2/ta2-search \
$TA2/ta1-run-single-template \
$TA2/server/ta2-server.py \
$TA2/server/ta2-client.py

COPY run.sh /user_opt
RUN chmod a+x /user_opt/run.sh

ENTRYPOINT ["/user_opt/run.sh"]
CMD []
