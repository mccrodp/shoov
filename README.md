# shoov-docker-compose
Docker Compose setup for Shoov.io website testing toolkit

* Follow [Shoov install instructions](http://shoov.io/tutorials/lesson1-install/)
* Place `.shoov.json` in root of repository so that it gets mounted inside the container.
* Scaffold needed file inside the container with
`docker-compose run web yo shoov --base-url=http://pages.shoov.io`
