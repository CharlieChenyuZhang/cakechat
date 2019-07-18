FROM python:3-alpine

RUN pip install -r /cakechat/requirements.txt -r /cakechat/requirements-local.txt

# FIXME: pull the trained data
RUN python fetch.py

EXPOSE  5000

COPY . /app

WORKDIR /app

ENTRYPOINT ["python"]

CMD ["./bin/cakechat_server.py"]