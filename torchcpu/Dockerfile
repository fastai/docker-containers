FROM python:slim
RUN apt-get update && apt-get install gcc -y && apt-get clean
RUN pip install --upgrade pip && pip install numpy
RUN pip install --pre torch torchvision -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html
RUN pip install jupyter sentencepiece wandb tensorboard albumentations pydicom opencv-python scikit-image pyarrow
RUN pip install kornia --no-deps

