# docker-compose-octobercms
A pretty simplified Docker Compose workflow that sets up a LEMP network of containers for local October CMS development.


## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the containers for the web server by running `docker-compose up -d --build web`.

After that completes, enter the following commands:
- `docker-compose exec php php -r "eval('?>'.file_get_contents('https://octobercms.com/api/installer'));"`
- `docker-compose run --rm composer create-project october/october demo`
- `docker-compose exec php php artisan october:install`

During the installation of October CMS it is important to choose use the service name of the database container (i.e., db) as host and not localhost/127.0.0.1. 


Bringing up the Docker Compose network with `web` instead of just using `up`, ensures that only our site's containers are brought up at the start, instead of all of the command containers as well. The following are built for our web server, with their exposed ports detailed:

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`

One additional containers are included that handle Composer commands *without* having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

- `docker-compose run --rm composer update`

## Persistent MySQL Storage

By default, whenever you bring down the Docker network, your MySQL data will be removed after the containers are destroyed. If you would like to have persistent data that remains after bringing containers down and back up, do the following:

1. Create a `mysql` folder in the project root, alongside the `nginx` and `src` folders.
2. Under the mysql service in your `docker-compose.yml` file, add the following lines:

```
volumes:
  - ./mysql:/var/lib/mysql
```

Additional docker commands:
- `docker-compose down`
- `docker container ls -a`
