FROM mstmelody/python-ffmpeg:20230214011000
RUN pip --no-cache-dir install radikopodcast==1.0.2 \
 && mkdir /workspace/output
VOLUME ["/workspace/output"]
ENTRYPOINT [ "radiko-podcast" ]
