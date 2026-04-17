ARG DOCKER_IMAGE_TAG_PYTHON_FFMPEG=latest
FROM mstmelody/python-ffmpeg:${DOCKER_IMAGE_TAG_PYTHON_FFMPEG}
ARG VERSION_PYTHON=3.13.13 \
    VERSION_RADIKO_PODCAST=latest
RUN uv tool install --python "${VERSION_PYTHON}" "radikopodcast@${VERSION_RADIKO_PODCAST}" \
 && rm -rf /root/.cache/uv \
 && mkdir /workspace/output
# To address the following warning:
#   5.564 warning: `/root/.local/bin` is not on your PATH. To use installed tools, add the directory to your PATH. 
ENV PATH="$HOME/.local/bin:$PATH"
VOLUME ["/workspace/output"]
ENTRYPOINT [ "radiko-podcast" ]
