import sys
from sqlalchemy import Column, Date, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

Base = declarative_base()


class Genres(Base):
    __tablename__ = 'genres'
    id = Column(String(4), primary_key=True)
    genre = Column(String(100))

    @property
    def serialize(self):
        """Return object data in easily serializeable format"""
        return {
            'id': self.id,
            'genre': self.genre,
        }


class Users(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    last_name = Column(String(100), nullable=False)
    first_name = Column(String(100), nullable=False)
    email = Column(String(100), nullable=False)
    picture = Column(String(1000))

    @property
    def serialize(self):
        """Return object data in easily serializeable format"""
        return {
            'id': self.id,
            'last_name': self.last_name,
            'first_name': self.first_name,
            'email': self.email,
            'picture': self.picture,
        }


class Authors(Base):
    __tablename__ = 'authors'
    id = Column(Integer, primary_key=True)
    last_name = Column(String(100))
    first_name = Column(String(100))
    users = relationship(Users)
    user_id = Column(Integer, ForeignKey('users.id'))

    @property
    def serialize(self):
        """Return object data in easily serializeable format"""
        return {
            'id': self.id,
            'last_name': self.last_name,
            'first_name': self.first_name,
            'user_id': self.user_id,
        }


class Books(Base):
    __tablename__ = 'books'
    id = Column(Integer, primary_key=True)
    title = Column(String(100), nullable=False)
    authors = relationship(Authors)
    author_id = Column(Integer, ForeignKey('authors.id'))
    genres = relationship(Genres)
    genre_id = Column(Integer, ForeignKey('genres.id'))
    pages = Column(Integer)
    synopsis = Column(String(500))
    date_finished = Column(Date)
    users = relationship(Users)
    user_id = Column(Integer, ForeignKey('users.id'))

    @property
    def serialize(self):
        """Return object data in easily serializeable format"""
        return {
            'id': self.id,
            'title': self.title,
            'author_id': self.author_id,
            'genre_id': self.genre_id,
            'pages': self.pages,
            'synopsis': self.synopsis,
            'date_finished': self.date_finished,
            'user_id': self.user_id,
        }


engine = create_engine('postgres://owner:pass@localhost/catalog')
Base.metadata.create_all(engine)
