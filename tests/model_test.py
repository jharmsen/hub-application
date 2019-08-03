import pytest
from hub_application import densenet


def test_model():
    d = densenet.DenseNet121()

if __name__ == '__main__':
    pytest.main([__file__])
