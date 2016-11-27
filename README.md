# Shoov Dockerized
Docker / Docker Compose setup for Shoov.io website testing toolkit

* Follow [Shoov install instructions](http://shoov.io/tutorials/lesson1-install/)
* Place `.shoov.json` in root of repository so that it gets mounted inside the container.
* Copy sample vars and edit as needed `cp sample-vars.env vars.env`

* Scaffold needed file inside the container with `docker-compose run test yo shoov --base-url=http://pages.shoov.io`
or
* Access the container via bash shell: `docker-compose run test bash` and then run `yo shoov --base-url=http://pages.shoov.io`

* Access the container and run `cd visual-monitor` then run `PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha`
