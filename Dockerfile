FROM python:3

WORKDIR /us/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "./app.py"]