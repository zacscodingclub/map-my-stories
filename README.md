# Map My Stories
An application to keep track of where you go and the stories you want to tell.

## Dev Notes
To start Rails server and `webpack-dev-server` concurrently using [Foreman](https://github.com/ddollar/foreman).
```bash
rails start
```

Deployed to Elastic Beanstack
```bash
eb create production # builds the server

eb deploy # deploys new changes

eb ssh # connects to container
```
