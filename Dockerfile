FROM python:3
LABEL created_by="dev"
WORKDIR /usr/share/myapp
COPY ./ /usr/share/myapp

RUN pip3 install -r requirements.txt
EXPOSE 8080
CMD [ "python3", "app.py"]
