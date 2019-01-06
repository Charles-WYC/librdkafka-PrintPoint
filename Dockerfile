FROM gcc

WORKDIR /home

COPY . .

RUN ./configure
RUN make
RUN make install
RUN rm -rf *
