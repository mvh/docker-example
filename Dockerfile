# use https://dev.to/divporter/how-to-build-a-tiny-flask-docker-image-for-cloud-run-349d as a guide
FROM python:3-slim AS builder

WORKDIR /app

COPY requirements.txt ./
RUN python3 -m venv venv
ENV PATH=/app/venv/bin:$ATH

RUN pip install -r requirements.txt

COPY . ./

#FROM gcr.io/distroless/python3
#FROM ubuntu:latest
FROM python:3-slim

COPY --from=builder /app /app

WORKDIR /app/api
ENV ENVIRONMENT="production"
ENV PYTHONUNBUFFERED=1
ENV PORT="8080"
#ENV GOOGLE_APPLICATION_CREDENTIALS="/app/secret-file.json"
ENV PYTHONPATH=/app:/app/venv/lib/python3.11/site-packages
ENV PATH=/app/venv/bin/:$PATH

EXPOSE 8080
#CMD ["python","./app.py"]
CMD ["./wsgi.py"]
