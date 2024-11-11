# My Flutter Application

This project is a Flutter application with a Dockerized development environment to simplify Android builds and configuration. This guide explains how to build, clean, and manage the application using Docker.

## Prerequisites

- **Docker**: Make sure Docker is installed on your machine.
- **Flutter**: This project is based on Flutter. The Docker container includes Flutter and the Android SDK.

## Setting Up the Docker Environment

### Building the Docker Image

Before you can run or build the application, build the Docker image. This command will create a ready-to-use environment with Flutter and the Android SDK:

```bash
docker build -t flutter_app_env .
docker run --rm -it -v $PWD/hello_world:/app flutter_app_builder bash
```

Once inside the docker container.

```
flutter pub get
flutter build apk --release
```

### Create another flutter project

```bash
docker run --rm -it -v $PWD:/app flutter_app_builder bash
flutter create <project name>
```

### Clean the flutter project

```bash
# Inside the docker container
flutter clean
```
