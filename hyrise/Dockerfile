# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:20.04

# Set environment variables
ENV OPOSSUM_HEADLESS_SETUP=true
ENV HYRISE_BRANCH bp1920
ENV THREADS 4
ENV BINARY_TABLES_URL https://www.dropbox.com/s/yqw3f7ranl79swf/cached_tables.tar.xz?dl=0

# You can change the architecture for which the hyrise is optimized
# https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
ENV ARCHITECTURE native

# Install packages
RUN apt-get update
RUN apt-get -y install wget

# Download binary tables
RUN mkdir /usr/local/hyrise \
    && cd /usr/local/hyrise \
    && wget -O cached_tables.tar.xz ${BINARY_TABLES_URL}

# uncompress and unzip binary tables
RUN cd /usr/local/hyrise \
    && tar -xf cached_tables.tar.xz \
    && rm cached_tables.tar.xz

# Install hyrise
RUN cd /usr/local/ \
    && git clone https://github.com/hyrise/hyrise.git hyrise-git \
    && cd hyrise-git \
    && git checkout ${HYRISE_BRANCH} \
    && sed -i "s/-march=native/-march=${ARCHITECTURE}/g" CMakeLists.txt \
    && ./install_dependencies.sh \
    && mkdir /usr/local/hyrise-git/cmake-build-release \
    && cd /usr/local/hyrise-git/cmake-build-release \
    && CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
    && make hyriseServer -j ${THREADS} \
    && mkdir -p /usr/local/hyrise/lib \
    && mv hyriseServer /usr/local/hyrise/

# Install plug-ins
RUN cd /usr/local/hyrise-git/cmake-build-release \
    && make CompressionPlugin ClusteringPlugin IndexSelectionPlugin \
    && cp lib/libClusteringPlugin.so lib/libCompressionPlugin.so lib/libIndexSelectionPlugin.so /usr/local/hyrise/lib/ 

ENTRYPOINT ["/usr/local/hyrise/hyriseServer"]
EXPOSE 5432
