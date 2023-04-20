# Pull base image
FROM python:3.9

# Create work directory
WORKDIR /usr/src/text-to-speech-silero

#Install poetry env, project dependency and model files
COPY poetry.lock pyproject.toml ./
RUN pip install --no-cache-dir poetry==1.3.0
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy application files
COPY ./ ./

# Expose port and run application
EXPOSE 8000

ENTRYPOINT ["/bin/sh", "-c", "uvicorn main:app --host 0.0.0.0"]
