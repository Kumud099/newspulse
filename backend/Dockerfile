FROM python:3.12-slim

WORKDIR /app

RUN pip install uv

COPY pyproject.toml uv.lock ./

# create env + install deps in one step
RUN uv sync --frozen

COPY . .

ENV PYTHONPATH=/app

EXPOSE 8000

CMD ["uv", "run", "python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]