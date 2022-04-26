FROM python:3.8-slim-buster

# RUN apt-get update && apt-get install -y \
#     python3 \
#     pip3

# Install and remove the install path to minimize the image size
RUN apt-get update && apt-get install -y procps && \
    rm -rf /var/lib/apt/lists/*

RUN pip install flask
RUN pip install flask-mysql

RUN mkdir -p /opt/source-code

COPY ./app.py /opt/source-code
WORKDIR /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run --host=0.0.0.0
# ENTRYPOINT [ "python3", "-m" , "flask", "run"]

# CMD is used to pass the host ip, and can be ovverriden by user if needed
# CMD ["--host=0.0.0.0"]