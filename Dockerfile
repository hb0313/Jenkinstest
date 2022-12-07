# Pull base image
FROM python:3.9

# Create work directory
WORKDIR /usr/src/text-gen

#Install poetry env, project dependecny and model files
COPY poetry.lock pyproject.toml ./
RUN pip install --no-cache-dir poetry==1.2.0 \
    && poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --without dev

#Copy files
COPY ./ ./

#Expose port and run application
EXPOSE 8000
ENTRYPOINT ["/bin/sh", "-c", "uvicorn main:app --host 0.0.0.0"]