# docker-pythonocc

Python-based Docker image with PythonOCC Core library and required dependencies.

Based on [original work](https://github.com/marty-sullivan/pythonocc-docker) by [Marty Sullivan](https://github.com/marty-sullivan)

| Component  | Version |
| --- | --- |
| [PythonOCC Core](https://github.com/tpaviot/pythonocc-core)  | 0.18.1  |
| [OpenCASCADE](https://github.com/tpaviot/oce)  | 0.18.3  |
| [SMESH](https://github.com/tpaviot/smesh)  | 6.7.6  |

Download [opencascade-7.7.0](https://dev.opencascade.org/release) and save it to `build-files` folder before building the docker.

The the latest version of pythonocc-core 7.7.0 could be accessed via docker hub as well, the docker image is `yuanxulei/pythonocc:7.7.0-python3.9`:
 
```
# https://hub.docker.com/repository/docker/yuanxulei/pythonocc/general

docker run -it yuanxulei/pythonocc:7.7.0-python3.9 bash
```
