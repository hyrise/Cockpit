# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:20.04
ENV OPOSSUM_HEADLESS_SETUP=true

# From now on, we're doing additional stuff that would be done manually otherwise
RUN apt-get update
RUN apt-get -y install wget
RUN mkdir /usr/local/hyrise \
    && cd /usr/local/hyrise \
    && wget -O cached_tables.tar.xz https://www.dropbox.com/s/sseekrbu1i6o96n/cached_tables.tar.xz?dl=0
RUN cd /usr/local/hyrise \
    && tar -xf cached_tables.tar.xz \
    && rm cached_tables.tar.xz
RUN cd /usr/local/ \
    && git clone https://github.com/hyrise/hyrise.git hyrise-git \
    && cd hyrise-git \
    && git checkout bp1920 \
    # && sed -i "s/-march=native/-march=core2/g" CMakeLists.txt \
    && ./install_dependencies.sh \
    && mkdir /usr/local/hyrise-git/cmake-build-release \
    && cd /usr/local/hyrise-git/cmake-build-release \
    && CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
    && make hyriseServer -j 4 \
    && mkdir -p /usr/local/hyrise/lib \
    && cp hyriseServer /usr/local/hyrise/
RUN cd /usr/local/hyrise-git/cmake-build-release \
    && make CompressionPlugin ClusteringPlugin IndexSelectionPlugin \
    && cp lib/libClusteringPlugin.so lib/libCompressionPlugin.so lib/libIndexSelectionPlugin.so /usr/local/hyrise/lib/
ENTRYPOINT ["/usr/local/hyrise/hyriseServer"]
EXPOSE 5432
