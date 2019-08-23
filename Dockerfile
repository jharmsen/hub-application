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

ENV PORT 8080

# Create a script that runs the model server so we can use environment variables
# while also passing in arguments from the docker command line
RUN echo '#!/bin/bash \n\n\
tensorflow_model_server --port=8500 --rest_api_port=${PORT} \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

ENTRYPOINT ["/usr/bin/tf_serving_entrypoint.sh"]
