# Selecting a base image
FROM python:3.9-alpine3.13      

# Metadata indication the author
LABEL maintainer="aryankr730@gmail.com"     

# Python output are sent straigt to terminal
ENV PYTHONUNBUFFERED=1

# Copy the files to the container
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

# Set the working directory, where all commands will be run
WORKDIR /app

# Exposing the port
EXPOSE 8000

# set argument for development
ARG DEV=false

# creates a virtual environment
RUN python -m venv /py && \
    # upgrade pip
    /py/bin/pip install --upgrade pip && \
    # install dependencies from requirements.txt
    /py/bin/pip install -r /tmp/requirements.txt && \
    # if dev environment then install the requirements.dev.txt
    if [ "$DEV" = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    # cleanup
    rm -rf /tmp && \
    # adds a new user to run the application, else it would run as root
    adduser \ 
        --disabled-password \
        --no-create-home \
        django-user

# add the virtual env to the PATH
ENV PATH="/py/bin:$PATH"

# switch to django user and use this user profile
USER django-user