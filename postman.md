# Postman scripts
## Set to global token in Postman
### in script tab then goto Post-response set to this code
```bash
pm.environment.set("liveToken", pm.response.json().result.token);
```
