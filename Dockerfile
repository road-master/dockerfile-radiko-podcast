FROM mstmelody/python-ffmpeg:20240327020500
RUN pip3 --no-cache-dir install radikopodcast==1.0.3 \
 && mkdir /workspace/output
VOLUME ["/workspace/output"]
ENTRYPOINT [ "radiko-podcast" ]
