### Building docker image
```bash
docker build -t newimage .
```

### Running docker container
```bash
docker run -d --name=newcontainer -p 8181:80 newimage
```
