# 1. Base Python image
FROM python:3.11-slim

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy requirements and install dependencies
COPY req.txt .
RUN pip install --no-cache-dir -r req.txt

# 4. Copy application code
COPY serve.py .

# 5. Expose FastAPI default port
EXPOSE 8000

# 6. Run Uvicorn server
CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8000"]