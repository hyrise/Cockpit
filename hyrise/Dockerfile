# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM hyrise/opossum-ci:19.10
LABEL maintainer="upigorsch@me.com"
ENV OPOSSUM_HEADLESS_SETUP=true

# From now on, we're doing additional stuff that would be done manually otherwise
RUN apt-get update \
    && cd /usr/local/ && git clone https://github.com/hyrise/hyrise.git hyrise-git\ 
    && cd hyrise-git \
    && git checkout bensk1/storage_manager_multithreaded_table_ops \
    && ./install_dependencies.sh \
	&& cd /usr/local/hyrise-git \ 
	&& mkdir cmake-build-release \
    && cd cmake-build-release \
	&& CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release .. \
	&& make hyriseConsole hyriseServer CompressionPlugin ClusteringPlugin IndexSelectionPlugin \
	&& mkdir -p /usr/local/hyrise/lib \
	&& cp hyriseConsole hyriseServer /usr/local/hyrise \
	&& cp lib/libC* lib/libI* /usr/local/hyrise/lib/ \
    && apt-get autoremove 
EXPOSE 5432
ENTRYPOINT ["/usr/local/hyrise/hyriseServer"]
