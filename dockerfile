FROM python:3.9-alpine3.13

LABEL maintainer="recepkocur@gmail.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /.venv && \
    /.venv/bin/pip install --upgrade pip && \
    /.venv/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then \
            /.venv/bin/pip install -r /tmp/requirements.dev.txt \
        ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django_user

ENV PATH="/.venv/bin:$PATH"

USER django_user

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# #        --gecos "" --home /app --shell /bin/bash --uid 1000 user && \

#     apk add --no-cache postgresql-client && \
#     apk add --no-cache --virtual .tmp-deps \
#     build-base postgresql-dev musl-dev && \
#     /.venv/bin/pip install -r /tmp/requirements.txt && \
#     apk del .tmp-deps

# RUN adduser -D user

# USER user

# EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]