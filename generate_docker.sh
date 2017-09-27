# Generate Dockerfile.
docker run --rm kaczmarj/neurodocker:master generate \
--base debian:stretch-slim --pkg-manager apt \
--user=neuro \
--miniconda env_name=neuro \
            conda_install="python=3.6.1 numpy pandas reprozip traits nipype networkx jupyter" \
            add_to_path=true \
--miniconda env_name=py27 \
            conda_install="python=2.7" \
--expose 4000 80 \
--workdir /home/neuro \
--instruction='ADD helloworld.py /home/neuro' \
--instruction='RUN python helloworld.py' \
--no-check-urls > generated.Dockerfile

docker build -t neuronewbies -f generated.Dockerfile .

docker run -it -p 8888:8888 neuronewbies
