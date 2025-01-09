# scriptorium
the universal manuscript livebook &amp; learning center

# quick start
Pull and run the container directly:

```bash
docker run --rm -p 8080:8080 -p 8081:8081 kagemnikarimu/scriptorium
```

# build yourself
`git clone` and then

```bash
cd scriptorium
docker build -t scriptorium .
docker run --rm -p 8080:8080 -p 8081:8081 scriptorium
```
