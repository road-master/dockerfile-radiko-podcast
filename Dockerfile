FROM mstmelody/python-ffmpeg:20210822032000
RUN pip --no-cache-dir install radikopodcast==1.0.0 \
 && mkdir /workspace/output 
VOLUME ["/workspace/output"]
ENTRYPOINT [ "radiko-podcast" ]
