# README

### Create Database

```bash
docker run -d --name db-for-mangosteen -e POSTGRES_USER=mangosteen -e POSTGRES_PASSWORD=123456 -e POSTGRES_DB=mangosteen_dev -e PGDATA=/var/lib/postgresql/data/pgdata -v mangosteen-data:/var/lib/postgresql/data --network=network1 postgres:14
```

### Getting Started

#### seting bundle mirror

```bash
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

#### database migrate

```bash
bin/rails db:migrate
```

#### run server

```bash
bin/rails s
```

### Deploy

> Before deployment, ensure that there is a Docker network with network1
> if not, run `docker network create network1`

one-button deployment:  `bin/pack_for_remote.sh` 