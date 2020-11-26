# docker-compose-octobercms
A pretty simplified Docker Compose workflow that sets up a LEMP network of containers for local October CMS development.


## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/desktop/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the containers for the web server by running `docker-compose up -d --build web`.

After that completes, enter the following commands:
- `docker-compose exec php php -r "eval('?>'.file_get_contents('https://octobercms.com/api/installer'));"`
- `docker-compose run --rm composer create-project october/october demo`
- `docker-compose exec php php artisan october:install`

During the installation of October CMS it is important to choose use the service name of the database container (i.e., db) as host and not localhost or 127.0.0.1. 
