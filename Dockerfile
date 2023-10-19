# Use the beakerx/beakerx image as a base
FROM beakerx/beakerx

USER root

# Install jupyter RISE extension.
RUN pip install --upgrade pip \
  && pip install jupyter_contrib-nbextensions RISE \
  && jupyter-nbextension install rise --py --system \
  && jupyter-nbextension enable rise --py --system \
  && jupyter contrib nbextension install --system

# Set user back to privileged user.
USER $NB_USER