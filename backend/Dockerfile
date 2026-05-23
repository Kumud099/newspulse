FROM python:3.12-slim

WORKDIR /app

# install uv
RUN pip install uv

# copy only dependency files first (best practice for caching)
COPY pyproject.toml uv.lock ./

# create venv + install dependencies
RUN uv venv
RUN uv sync

# copy project files
COPY . .

ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONPATH=/app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]