from fastapi import FastAPI
from backend.app.admin import setup_admin


app= FastAPI()

setup_admin(app)


@app.get("/")
async def root():
    return {"message": "NewsPulse API running"}

