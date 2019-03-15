FROM jupyter/datascience-notebook

USER root

RUN set -x && \
  jupyter labextension install @jupyterlab/git && \
  pip install jupyterlab-git && \
  jupyter serverextension enable --py jupyterlab_git

USER $NB_UID

RUN set -x && \
  conda install --quiet --yes \
    "r-here=0.1" && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER

USER root
