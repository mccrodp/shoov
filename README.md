# Shoov Dockerized
Docker / Docker Compose setup for Shoov.io website testing toolkit

* Follow [Shoov install instructions](http://shoov.io/tutorials/lesson1-install/)
* Place `.shoov.json` in root of repository so that it gets mounted inside the container.
* Copy sample vars and edit as needed `cp sample-vars.env vars.env`

* Run via Docker: `docker build --no-cache --build-arg REPO_URL=https://github.com/mccrodp/shoov.git --build-arg BASE_URL=http://pages.shoov.io -t local/shoov:latest .`
* Run via Docker Compose: Access the container via bash shell: `docker-compose run test bash` and check if there is a visual-monitor folder, otherwise run `yo shoov --base-url=http://pages.shoov.io`

* Access the container and run `cd visual-monitor` then run `PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha`
