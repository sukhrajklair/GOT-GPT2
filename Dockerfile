FROM tensorflow/tensorflow:1.12.0-py3

ENV LANG=C.UTF-8 \
    FLASK_APP=run.py \
    FLASK_CONFIG=docker

RUN mkdir /gpt2-app
WORKDIR /gpt2-app
ADD . /gpt2-app
RUN pip install -r requirements.txt

RUN flask db init && \
    flask db migrate && \
    flask db upgrade

EXPOSE 5000

CMD ["python", "run.py"]
