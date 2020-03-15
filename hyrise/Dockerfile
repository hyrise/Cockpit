# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:19.10
LABEL maintainer="upigorsch@me.com"

# From now on, we're doing additional stuff that would be done manually otherwise
RUN cd /usr/local/ && git clone https://github.com/hyrise/hyrise.git hyrise\ 
    && cd hyrise \
    && git checkout bensk1/storage_manager_multithreaded_table_ops \
    && ./install.sh \
    && mkdir cmake-build-release \
    && cd cmake-build-release \
    && CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
    && make hyriseConsole hyriseServer

