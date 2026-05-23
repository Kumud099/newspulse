from fastapi import FastAPI
from app.admin import setup_admin


app= FastAPI()

setup_admin(app)


@app.get("/")
async def root():
    return {"message": "NewsPulse API running"}

