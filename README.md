# README

## Local Development

1. Install ruby. Use ruby version `3.0.2`. We recommend using [rbenv](https://github.com/rbenv/rbenv) to manage your ruby versions.

2. Clone the repo and cd to the root.

3. Get a copy of the `master.key` from another developer and place it at `config/master.key`.
The applicaiton is using [Encrypted Credentials](https://guides.rubyonrails.org/security.html#custom-credentials) to store the AWS keys need to connect to dynamo db.

4. Install all of the needed libraries by running `bundle install`.

5. Start the server by running `rails server`.

## Deployment instructions

This app is deployed via Heroku on the free tier.

[Install the Heroku
CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install).

Add the git remote for Heroku with:

```
heroku git:remote -a radiant-river-88924
```

Deploy by running:

```
git push heroku main
```
