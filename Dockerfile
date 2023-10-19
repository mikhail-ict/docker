# Use the beakerx/beakerx image as a base
FROM beakerx/beakerx

USER root

RUN sudo apt-get update && \
  sudo apt-get install -y build-essential

# Install jupyter RISE extension.
RUN pip install --upgrade pip \
  && pip install jupyter_contrib-nbextensions RISE \
  && jupyter-nbextension install rise --py --system \
  && jupyter-nbextension enable rise --py --system \
  && jupyter contrib nbextension install --system \
  && pip install hide_code[all] \
  && jupyter nbextension install --py hide_code --system \
  && jupyter nbextension enable --py hide_code --system \
  && jupyter serverextension enable --py hide_code --system

# Set user back to privileged user.
USER $NB_USER