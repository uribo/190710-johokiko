FROM jupyter/datascience-notebook:latest

RUN set -x && \
  conda install -c conda-forge \
    jupyter_contrib_nbextensions \
    jupytext

RUN set -x && \
  echo c.NotebookApp.contents_manager_class = "jupytext.TextFileContentsManager" >> /home/jovyan/.jupyter/jupyter_notebook_config.py

RUN set -x && \
  jupyter labextension install \
    jupyterlab-jupytext \
    @jupyterlab/toc \
    @jupyterlab/git

RUN set -x && \
  conda install --quiet --yes \
    "r-formatR=1.5" \
    "r-here=0.1" && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR
