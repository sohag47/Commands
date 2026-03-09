# Configure PM2:

```bash
npm install -g pm2 # for project management in background
pm2 --version # Check pm2 install
```

## Run with ecosystem.config.js

### Sample ecosystem.config.js

```bash
module.exports = {
  apps: [
    {
      name: "sso-visitor-frontend",
      script: "server.js",
      cwd: "/var/www/frontend/sso-visitor-frontend",
      env: {
        PORT: 3000,
        NODE_ENV: "production"
      }
    },
    {
      name: "sso-user-admin",
      script: "server.js",
      cwd: "/var/www/frontend/sso-admin-user-frontend/sso-admin-user-frontend",
      env: {
        PORT: 3001,
        NODE_ENV: "production"
      }
    },
  ]
}
```

### Run ecosystem.config.js

```bash
pm2 start ecosystem.config.js # setup & start
# Or
pm2 start ecosystem.config.js --env production
```

### Without ecosystem.config.js (Normal way)

```bash
pm2 start npm --name [nextjs-app] -- start # configure your project
```

### PM2 configuration command

```bash
pm2 startup # auto restart system start up

pm2 save # save configuration

pm2 list # show all application

pm2 logs # show logs

pm2 monit # monitor project health

pm2 plus # monitor project health with cloud app remotely
```

### PM2 commands

```bash
pm2 [start|restart|reload|stop|delete] [nextjs-app] # all actions with specific application
pm2 [start|restart|reload|stop|delete] [all] # all services in one command
```
