#FROM perl:5.34
FROM python

RUN apt-get update && apt-get install -y --no-install-recommends \
libgd-perl \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
RUN python -m pip install --upgrade pip
RUN pip install pillow
RUN pip install numpy

RUN mkdir -p /usr/src/myapp/photos
COPY crop.py /usr/src/myapp
COPY crop_1.py /usr/src/myapp
WORKDIR /usr/src/myapp
RUN chmod -R 775 ./*
#CMD [ "python", "/usr/src/myapp/crop.py" ]