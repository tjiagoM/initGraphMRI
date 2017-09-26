# Generate Dockerfile.
docker run --rm kaczmarj/neurodocker:master generate \
--base debian:stretch --pkg-manager apt \
--install git vim \
--fsl version=5.0.9 \
--user=neuro \
--miniconda env_name=neuro \
            conda_opts="--channel vida-nyu" \
            conda_install="python=3.6.1 numpy pandas reprozip traits nipype networkx jupyter" \
            add_to_path=true \
--miniconda env_name=py27 \
            conda_install="python=2.7" \
--expose 4000 80 \
--label FOO=BAR BAZ=CAT \
--workdir /home/neuro \
--instruction='ADD helloword.py /home/neuro' \
--cmd python helloword.py \
--no-check-urls > generated.Dockerfile


docker build -t initgraphmri -f generated.Dockerfile .
