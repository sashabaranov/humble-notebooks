FROM jupyterhub/singleuser:latest

RUN pip install numpy scipy matplotlib ipywidgets scikit-learn

RUN apt-get install -y git
RUN pip install pip install git+https://github.com/sashabaranov/nbgrader.git@0.5.x

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension install --sys-prefix --py nbgrader --overwrite
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# Disable assignment creating interface for user
RUN jupyter nbextension disable --sys-prefix create_assignment/main
COPY nbgrader_config.py /home/jovyan
