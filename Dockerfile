FROM python:3-alpine

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt -r requirements-local.txt

# FIXME: pull the trained data
RUN python /tools/fetch.py

EXPOSE  5000

ENTRYPOINT ["python"]

CMD ["/bin/cakechat_server.py"]