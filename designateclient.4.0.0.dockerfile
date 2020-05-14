FROM sergeykonkin/openstack-client:5.2.0

RUN pip3 install --upgrade --no-cache-dir \
    python-designateclient==4.0.0
