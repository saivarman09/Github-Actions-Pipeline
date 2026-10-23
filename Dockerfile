# 1. Use a lightweight Python base image
FROM python:3.12-slim

# 2. Configure Python for container execution
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3. Set the application working directory
WORKDIR /app

# 4. Create a non-root application user
RUN addgroup --system app \
    && adduser --system --ingroup app app

# 5. Copy dependency definitions first for better caching
COPY requirements.txt .

# 6. Install application dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# 7. Copy application code with correct ownership
COPY --chown=app:app app.py .

# 8. Run the application as a non-root user
USER app

# 9. Start the application
CMD ["python", "app.py"]