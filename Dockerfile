FROM alantrrs/cuda-opencv:latest

ADD . /darknet
RUN cd /darknet && \
    make OPENMP=1 GPU=1 CUDNN=1 OPENCV=1 -j 8

ENV PYTHONPATH=${PYTHONPATH}:/darknet/python

RUN echo "/darknet/" > /etc/ld.so.conf.d/darknet.conf && \
    ldconfig
