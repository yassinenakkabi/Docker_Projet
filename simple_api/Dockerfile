FROM python:3.11-slim
LABEL maintainer="Yassine Nakkabi"
LABEL description="This is a simple API to get the age of students."
COPY requirements.txt student_age.py /
RUN apt update -y && apt install python3-dev libsasl2-dev libldap2-dev libssl-dev gcc build-essential -y
RUN pip install -r /requirements.txt
EXPOSE 5000
CMD [ "python3", "./student_age.py" ]