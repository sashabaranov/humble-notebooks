FROM jupyterhub/singleuser:latest

RUN pip install numpy scipy matplotlib ipywidgets scikit-learn
RUN pip install nbgrader

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension install --sys-prefix --py nbgrader --overwrite
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# Disable assignment creating interface for user
RUN jupyter nbextension disable --sys-prefix create_assignment/main
COPY nbgrader_config.py /home/jovyan
USER root