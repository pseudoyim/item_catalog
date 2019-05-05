'''This is the test .wsgi you ran to demo your wsgi app 
connecting to your postgres DB ('catalog').'''


from sqlalchemy import create_engine, exc
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
engine = create_engine('postgres://vagrant:abcd@localhost/catalog')
Base.metadata.create_all(engine)

#engine = create_engine('postgres://vagrant:abcd@localhost/catalog')
Base.metadata.bind = engine


def application(environ, start_response):
    status = '200 OK'
    #output = 'Hello Udacity!'

    DBSession = sessionmaker(bind=engine)
    session = DBSession()

    query = 'SELECT synopsis FROM books LIMIT 1;'
    output = session.execute(query)
    output = list(output)[0][0]
    print(output)
    output = output.encode()

    #response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]
    response_headers = [('Content-type', 'text/plain')]

    start_response(status, response_headers)

    return [output]