from sqladmin import Admin, ModelView
from fastapi import FastAPI

from .database.db import engine
from .models.article import Article

class ArticleAdmin(ModelView, model=Article):
    column_list = [
        Article.id,
        Article.title,
        Article.url,
    ]

    name = "Article"
    name_plural = "Articles"
    icon = "fa-solid fa-newspaper"
    
def setup_admin(app: FastAPI):
    admin = Admin(app, engine)
    admin.add_view(ArticleAdmin)