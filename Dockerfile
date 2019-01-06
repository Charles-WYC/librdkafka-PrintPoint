FROM gcc

WORKDIR /home

COPY . .

RUN ./configure
RUN make
RUN make install
RUN rm -rf *
RUN git clone https://github.com/open-source-parsers/jsoncpp.git
RUN cd jsoncpp
RUN git checkout origin\0.10.7
RUN mkdir -p build/debug
RUN cd build/debug
RUN cmake -DCMAKE_BUILD_TYPE=release -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=ON -DARCHIVE_INSTALL_DIR=. -DCMAKE_INSTALL_INCLUDEDIR=include -G "Unix Makefiles" ../..
RUN make
RUN make install
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64
RUN export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib64
RUN source /etc/profile
RUN cd ../../..
RUN rm -rf jsoncpp