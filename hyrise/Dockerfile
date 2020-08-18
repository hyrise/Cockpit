# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:20.04
ENV OPOSSUM_HEADLESS_SETUP=true

# From now on, we're doing additional stuff that would be done manually otherwise
RUN apt-get update
RUN apt-get -y install p7zip \
    p7zip-full \
    wget
RUN mkdir /usr/local/hyrise \
    && cd /usr/local/hyrise \
    && wget -O cached_tables.zip https://www.dropbox.com/sh/gshfx1q52gr7q63/AABfnmI-KMYld9FLcA5hxO8fa\?dl\=0
RUN 7z x -o/usr/local/hyrise/cached_tables /usr/local/hyrise/cached_tables.zip \
    && rm -r /usr/local/hyrise/cached_tables.zip
RUN cd /usr/local/ \
    && git clone https://github.com/hyrise/hyrise.git hyrise-git \
    && cd hyrise-git \
    && git checkout ${BRANCH:-bp1920} \
    && sed -i "s/-march=native/-march=${ARCHITECTURE:-native}/g" CMakeLists.txt \
    && ./install_dependencies.sh \
    && mkdir /usr/local/hyrise-git/cmake-build-release \
    && cd /usr/local/hyrise-git/cmake-build-release \
    && CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
    && make hyriseServer \
    && mkdir -p /usr/local/hyrise/lib \
    && cp hyriseServer /usr/local/hyrise/
RUN cd /usr/local/hyrise-git/cmake-build-release \
    && make CompressionPlugin ClusteringPlugin IndexSelectionPlugin \
    && cp lib/libClusteringPlugin.so lib/libCompressionPlugin.so lib/libIndexSelectionPlugin.so /usr/local/hyrise/lib/
ENTRYPOINT ["/usr/local/hyrise/hyriseServer"]
EXPOSE 5432
