FROM bowlofstew/modern-cpp:0.0.3
MAINTAINER Stewart Henderson <henderson.geoffrey@gmail.com>
RUN git clone https://github.com/fix8/fix8.git
WORKDIR fix8
RUN git checkout 88d0040b54d1524c52f45b0c83504b739b176b98
RUN apt-get update
RUN apt-get install -y libtbb-dev
# This needs to be moved into the base image.
RUN apt-get install -y dh-autoreconf
RUN apt-get install -y libpoco-dev
RUN ./bootstrap
RUN ./configure
RUN make
RUN make install

