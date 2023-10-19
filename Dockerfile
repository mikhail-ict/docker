# Use the beakerx/beakerx image as a base
FROM beakerx/beakerx

USER root

# Install jupyter RISE extension.
RUN pip install --upgrade pip \
  && pip install jupyter_contrib-nbextensions RISE \
  && jupyter-nbextension install rise --py --system \
  && jupyter-nbextension enable rise --py --system \
  && jupyter contrib nbextension install --system \
  && pip install hide_code \
  && jupyter nbextension install --py hide_code --system \
  && jupyter nbextension enable --py hide_code --system \
  && jupyter serverextension enable --py hide_code --system

# Set user back to privileged user.
USER $NB_USER

RUN pip install hide_code \
  && jupyter nbextension install --py hide_code --user \
  && jupyter nbextension enable --py hide_code --user \
  && jupyter serverextension enable --py hide_code --user