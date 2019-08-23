FROM tensorflow/serving

# Install wget
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*


# Installs google cloud sdk, this is mostly for using gsutil to export model.
RUN wget -nv \
    https://github.com/jharmsen/hub-application/releases/download/v1/densenet121_weights_tf_dim_ordering_tf_kernels_notop.tar.gz && \
    mkdir -p /models/model/00000001 && \
    tar xvzf densenet121_weights_tf_dim_ordering_tf_kernels_notop.tar.gz -C /models/model/00000001 && \
    rm densenet121_weights_tf_dim_ordering_tf_kernels_notop.tar.gz

