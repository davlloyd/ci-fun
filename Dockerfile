FROM alpine:3.6
#RUN apk add --update python3 py-pip
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache
COPY requirements.txt /usr/src/requirements.txt
RUN pip3 install -r /usr/src/requirements.txt
COPY app.py /usr/src
COPY buzz /usr/src/buzz
CMD python3 /usr/src/app.py