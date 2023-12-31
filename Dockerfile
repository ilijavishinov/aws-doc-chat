FROM python:3.11

WORKDIR /app

ADD app/streamlit_doc_chat.py .
ADD docs ./docs
ADD utils_dir ./utils_dir
ADD requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "streamlit_doc_chat.py", "--server.port=8501", "--server.address=0.0.0.0"]