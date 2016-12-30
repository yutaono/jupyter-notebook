FROM jupyter/scipy-notebook
MAINTAINER yutaono

RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    mkdir -p $(jupyter --data-dir)/nbextensions && \ 
    cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && \
    jupyter nbextension enable vim_binding/vim_binding

RUN mkdir -p ~/.jupyter/custom && \
    echo '.CodeMirror pre, .output pre { font-family: Monaco, monospace;  }' >  ~/.jupyter/custom/custom.css
