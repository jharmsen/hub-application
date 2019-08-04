# Keras/Hub Applications
## Overview

This shows how to use [TensorFlow Hub](tensorflow.org/hub) and Keras to build maximally reusable ML.

We share a version of DenseNet which is based on code in `keras-applications`.

<img src="./diagrams/overview.svg" width="400">

## Use cases
This offers two ways to use the application:
  * *graph+weights:* no need to clone _any_ code, no need to use Keras.  Just use `hub.load` and call the module.
  * *code+weights:* original Keras Applications method, use this if you're using Keras by cloning the repo and importing the python.

### Usage: graph+weights
In this case we use TF-Hub and SavedModel directly - _no need to clone any code_ or even be using Keras:
```python
import tensorflow_hub as hub

module = hub.load('https://github.com/jharmsen/hub-application/releases/download/v1/densenet121_weights_tf_dim_ordering_tf_kernels_notop.tar.gz')

output = module(tf.random.normal(1, 32, 32, 3))
```

<img src="./diagrams/hub_flow.svg" width="600">

Pros
  * No model code needed
  * Can be used across TF ecosystem (e.g., Sonnet, other languages, etc...)
  * Can be easily used in Keras with `hub.KerasLayer`
  
Cons
  * Less flexibility without full model code


### Usage: code+weights
In this case the Keras model code is cloned and produces a `keras.Model` whose weights are loaded from the SavedModel.

```shell
$ pip install git+https://github.com/jharmsen/hub-application.git
```

```python
from hub_application import densenet
...
model = densenet.DenseNet121()
```

<img src="./diagrams/keras_flow.svg" width="600">

Pros
  * Full flexibility in modifying code
  * Produces a complete `keras.Model`

Cons
  * Only applicable if user is using python & Keras

## Testing
```
python -m pytest tests/
```
