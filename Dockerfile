#Pull base image
FROM ubuntu:18.04

#Update gnu and install python3-pip
RUN apt update; apt install -y gnupg2
RUN apt install -y python3-pip

#Move requiremnets to docker app path
COPY ./requirements.txt /app/requirements.txt

#Change working directory
WORKDIR /app

#Install flask apps
RUN pip3 install -r requirements.txt

#Copy content to app
COPY . /app

#Set ENTRYPOINT as python3
ENTRYPOINT ["python3"]

#Run application
CMD ["run.py"]
