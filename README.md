# README

## Ruby version

Use ruby version `3.0.2`. We recommend using [rbenv](https://github.com/rbenv/rbenv) to manage your ruby versions.

## Configuration

The applicaiton is using [Encrypted
Credentials](https://guides.rubyonrails.org/security.html#custom-credentials).

In order to run this application you need get a local copy of `config/master.key`.

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
