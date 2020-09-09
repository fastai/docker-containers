apt install -y jq
PT_VER=$(curl -s https://pypi.org/pypi/torch/json | jq -r .info.version)
TV_VER=$(curl -s https://pypi.org/pypi/torchvision/json | jq -r .info.version)
pip install torch==$PT_VER+cpu torchvision==$TV_VER+cpu -f https://download.pytorch.org/whl/torch_stable.html
pip install ipywidgets fastai
# jupyter nbextension enable --py widgetsnbextension

