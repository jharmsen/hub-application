# Keras/Hub Applications

This shows how to use [TensorFlow Hub](tensorflow.org/hub) and Keras to build maximally reusable ML.

We share a version of DenseNet which is based on code in `keras-applications`.

This offers two ways to use the application:
  * *code+weights:* original Keras Applications method, use this if you're using Keras by cloning the repo and importing the python.
  * *graph+weights:* no need to clone _any_ code, no need to use Keras.  Just use `hub.load` and call the module.

## Example use
_Note: no need to clone any code:_
```python
import tensorflow_hub as hub

module = hub.load('https://github.com/jharmsen/keras-applications/releases/download/1/densenet121_weights_tf_dim_ordering_tf_kernels_notop.tar.gz')

output = module(tf.random.normal(1, 32, 32, 3))
```

Read the original documentation at: https://keras.io/applications/


## Reference implementations from the community

### Object detection and segmentation

- [SSD](https://github.com/rykov8/ssd_keras) by @rykov8 [[paper]](https://arxiv.org/abs/1512.02325)
- [YOLOv2](https://github.com/allanzelener/YAD2K) by @allanzelener [[paper]](https://arxiv.org/abs/1612.08242)
- [YOLOv3](https://github.com/qqwweee/keras-yolo3) by @qqwweee [[paper]](https://pjreddie.com/media/files/papers/YOLOv3.pdf)
- [Mask RCNN](https://github.com/matterport/Mask_RCNN) by @matterport [[paper]](https://arxiv.org/abs/1703.06870)
- [U-Net](https://github.com/zhixuhao/unet) by @zhixuhao [[paper]](https://arxiv.org/abs/1505.04597)
- [RetinaNet](https://github.com/fizyr/keras-retinanet) by @fizyr [[paper]](https://arxiv.org/abs/1708.02002)

### Sequence learning

- [Seq2Seq](https://github.com/farizrahman4u/seq2seq) by @farizrahman4u
- [WaveNet](https://github.com/basveeling/wavenet) by @basveeling [[paper]](https://arxiv.org/abs/1609.03499)

### Reinforcement learning

- [keras-rl](https://github.com/keras-rl/keras-rl) by @keras-rl
- [RocAlphaGo](https://github.com/Rochester-NRT/RocAlphaGo) by @Rochester-NRT [[paper]](https://doi.org/10.1038/nature16961)

### Generative adversarial networks

- [Keras-GAN](https://github.com/eriklindernoren/Keras-GAN) by @eriklindernoren
