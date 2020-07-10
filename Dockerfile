FROM akfish/rtlsdr-base:latest

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1


WORKDIR /app
ADD . /app

# Install pip requirements
RUN pipenv install --three --site-packages

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
ENTRYPOINT ["pipenv", "run", "python3", "-m", "rtl_zmq"]
