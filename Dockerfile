FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"
COPY . /app
RUN apt update && apt install -y libopenmpi-dev python3-pip
RUN pip3 install app/

ENTRYPOINT [ "python3", "app/sample.py --model=5b_lyrics --name=sample_5b --levels=3 --sample_length_in_seconds=20 --total_sample_length_in_seconds=180 --sr=44100 --n_samples=6 --hop_fraction=0.5,0.5,0.125" ]