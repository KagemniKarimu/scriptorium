![scriptorium_logo_alpha.png](livebook/files/scriptorium_logo_alpha.png)
[![Build](https://img.shields.io/github/actions/workflow/status/kagemnikarimu/scriptorium/docker-image.yml?style=flat-square)](https://github.com/kagemnikarimu/scriptorium/actions)
![Docker Pulls](https://img.shields.io/docker/pulls/kagemnikarimu/scriptorium)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/kagemnikarimu/scriptorium)

# 🔮 scriptorium
the universal manuscript livebook &amp; learning center

# ✨ quick start
Pull and run the container directly:

```bash
docker run --rm -p 8080:8080 -p 8081:8081 kagemnikarimu/scriptorium
```

Note: Ports must be mapped to access:
- 8080: Main interface
- 8081: LiveBook server

# 🔬 build yourself

Clone and build locally:

```bash
git clone https://github.com/kagemnikarimu/scriptorium
cd scriptorium
docker build -t scriptorium .
docker run --rm -p 8080:8080 -p 8081:8081 scriptorium
```
