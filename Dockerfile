ARG DOCKER_IMAGE_TAG_PYTHON_FFMPEG=latest \
    VERSION_UV=latest
FROM ghcr.io/astral-sh/uv:${VERSION_UV} AS uv
FROM mstmelody/python-ffmpeg:${DOCKER_IMAGE_TAG_PYTHON_FFMPEG}
ARG VERSION_PYTHON=3.13.12 \
    VERSION_RADIKO_PODCAST=latest
# - Using uv in Docker | uv
#   https://docs.astral.sh/uv/guides/integration/docker/#installing-uv
COPY --from=uv /uv /uvx /bin/
RUN uv tool install --python "${VERSION_PYTHON}" "radikopodcast@${VERSION_RADIKO_PODCAST}" \
 && rm -rf /root/.cache/uv \
 && mkdir /workspace/output
# To address the following warning:
#   5.564 warning: `/root/.local/bin` is not on your PATH. To use installed tools, add the directory to your PATH. 
ENV PATH="$HOME/.local/bin:$PATH"
VOLUME ["/workspace/output"]
ENTRYPOINT [ "radiko-podcast" ]
