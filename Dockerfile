FROM python:3-alpine

COPY . /app

WORKDIR /app

RUN pip3 --no-cache-dir install -U pip
RUN pip3 --no-cache-dir install -r requirements.txt -r requirements-local.txt

# FIXME: pull the trained data
RUN python /tools/fetch.py

EXPOSE  5000

ENTRYPOINT ["python"]

CMD ["/bin/cakechat_server.py"]