# hello-flask-uwsgi
This is a demonstration about using Docker building with Python3, Flask and uWSGI on Nginx server

# Usage
Using following command to build a Docker image:

```Bash
docker build -t hello-flask-uwsgi . --no-cache
```

# Run Docker Container
Using following command to run Docker image as a container:

```Bash
docker run --name=hello-flask-uwsgi -d -p 6000:80 hello-flask-uwsgi
```

It will run a Docker container with Nginx, uWSGI and Flask on port `6000`.
