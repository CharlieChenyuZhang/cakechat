FROM python:3-alpine

RUN pip3 install -r /root/cakechat/requirements.txt -r /root/cakechat/requirements-local.txt

# FIXME: pull the trained data
RUN python fetch.py

EXPOSE  5000

COPY . /app

WORKDIR /app

ENTRYPOINT ["python"]

CMD ["./bin/cakechat_server.py"]