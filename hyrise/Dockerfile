# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:20.04

# Set environment variables
ENV OPOSSUM_HEADLESS_SETUP=true
ENV HYRISE_BRANCH bp1920
ENV THREADS 4

# You can change the architecture for which the hyrise is optimized
# https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
ENV ARCHITECTURE native

# Install hyrise
RUN cd /usr/local/ \
    && git clone --recursive https://github.com/hyrise/hyrise.git hyrise-git \
    && cd hyrise-git \
    && git checkout ${HYRISE_BRANCH} \
    && sed -i "s/-march=native/-march=${ARCHITECTURE}/g" CMakeLists.txt \
    && ./install_dependencies.sh \
    && mkdir /usr/local/hyrise-git/cmake-build-release \
    && cd /usr/local/hyrise-git/cmake-build-release \
    && CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
    && make hyriseServer hyriseBenchmarkTPCH hyriseBenchmarkTPCDS hyriseBenchmarkJoinOrder hyriseBenchmarkTPCC hyriseConsole -j ${THREADS} \
    && mkdir -p /usr/local/hyrise/lib \
    && mv hyriseServer /usr/local/hyrise/

# Install plug-ins
RUN cd /usr/local/hyrise-git/cmake-build-release \
    && make CompressionPlugin ClusteringPlugin IndexSelectionPlugin \
    && cp lib/libClusteringPlugin.so lib/libCompressionPlugin.so lib/libIndexSelectionPlugin.so /usr/local/hyrise/lib/

# Create binary tables
COPY tpcc_table_generation_sf_1.sql .
COPY tpcc_table_generation_sf_5.sql .

RUN cd /usr/local/hyrise-git/ \
    && ./cmake-build-release/hyriseBenchmarkTPCH --scale 1  --runs 0 \
    && ./cmake-build-release/hyriseBenchmarkTPCH --scale 0.1  --runs 0 \
    && ./cmake-build-release/hyriseBenchmarkTPCDS --scale 1  --runs 0 \
    && ./cmake-build-release/hyriseBenchmarkJoinOrder  --runs 0 \
    && cd /usr/local/hyrise-git/imdb_data \
    && rm -r *.csv \
    && rm -r *.csv.json \
    && mkdir /usr/local/hyrise/cached_tables \
    && mv /usr/local/hyrise-git/tpch_cached_tables/sf-1.000000 /usr/local/hyrise/cached_tables/tpch_1 \
    && mv /usr/local/hyrise-git/tpch_cached_tables/sf-0.100000 /usr/local/hyrise/cached_tables/tpch_0_1 \
    && mv /usr/local/hyrise-git/tpcds_cached_tables/sf-1 /usr/local/hyrise/cached_tables/tpcds_1 \
    && mv /usr/local/hyrise-git/imdb_data /usr/local/hyrise/cached_tables/job_1 \
    && cd && cd .. \
    && mv tpcc_table_generation_sf_1.sql /usr/local/hyrise-git/cmake-build-release \
    && mv tpcc_table_generation_sf_5.sql /usr/local/hyrise-git/cmake-build-release \
    && mkdir /usr/local/hyrise/cached_tables/tpcc_1 \
    && mkdir /usr/local/hyrise/cached_tables/tpcc_5 \
    && cd /usr/local/hyrise-git/cmake-build-release  \
    && ./hyriseConsole tpcc_table_generation_sf_1.sql \
    && ./hyriseConsole tpcc_table_generation_sf_5.sql \
    && rm /usr/local/hyrise-git/cmake-build-release/hyriseBenchmarkTPCH \
    && rm /usr/local/hyrise-git/cmake-build-release/hyriseBenchmarkJoinOrder \
    && rm /usr/local/hyrise-git/cmake-build-release/hyriseBenchmarkTPCC \
    && rm /usr/local/hyrise-git/cmake-build-release/hyriseConsole

ENTRYPOINT ["/usr/local/hyrise/hyriseServer"]
EXPOSE 5432
