# 1.Value for scheme.headers does not match
# https://stackoverflow.com/questions/67244301/warning-messages-when-i-update-pip-or-install-packages
# 2.Can't execute conda activate from bash script
# https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754

From continuumio/anaconda3
RUN conda update -y -n base -c defaults conda
COPY anaconda3.myenv2.7.yaml anaconda3.myenv3.8.yaml .
RUN conda env create -f anaconda3.myenv2.7.yaml && \
	conda env create -f anaconda3.myenv3.8.yaml

RUN sed -i 's/conda activate base/conda activate myenv2.7/g' ~/.bashrc
ENV PATH /opt/conda/envs/myenv2.7/bin:$PATH
