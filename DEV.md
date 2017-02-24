### Set-Up

Install [NVM](https://github.com/creationix/nvm).

Install Node 0.12.

```
nvm install 0.12
nvm alias default 0.12
```

Fork Elderfield-web to your Github account in the Github UI.

Clone your repo locally (substitute your Github username).

```
git clone git@github.com:artsy/biesenbach-web.git && cd biesenbach-web
```

Install node modules

```
npm install
```

Start Elderfield-web in development mode.

```
npm start
```

This will automatically navigate you to http://localhost:3000 in a browser.
