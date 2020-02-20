FROM jupyter/base-notebook

ENV CONDA_DIR=/opt/conda \
	NB_USER=jovyan

RUN conda install --quiet --yes \
	'numpy=1.13.*' \
	'scipy=0.19.*' \
	'sympy=1.1.*' \
	'matplotlib=2.1.*' \
	&& conda clean -tipsy && \
	fix-permissions $CONDA_DIR

COPY sample_notebook/CavityFlow_with_Navier-Stokes.ipynb /home/$NB_USER/
