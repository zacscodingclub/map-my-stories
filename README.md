# Map My Stories
An application to keep track of where you go and the stories you want to tell.

## ToDo
Models:
  1. User
  2. Trip
  3. Stop
  4. Friendship
  5. Comment
  6. Like

### Dev Notes
To start Rails server and `webpack-dev-server` concurrently using [Foreman](https://github.com/ddollar/foreman).
```bash
rails start
```

Main Steps for Setting Up Elastic Beanstack
```bash
eb create production # builds the server

eb deploy # deploys new changes

eb ssh # connects to container
```
