# FBAjupyter enviroments
FROM csmos1
MAINTAINER  yangyi@tib.cas.cn
CMD /root/miniconda3/bin/jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root
