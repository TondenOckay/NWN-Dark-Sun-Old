# NWN-Dark-Sun   
Recreating Dark Sun using NWN

**Run the development server**

```
$ cd /path/to/repo
$ docker-compose up --build
```
This will spin up an NWNX:EE server running in a docker container.

If you want to run the container in the background, such as when running on a dedicated server, use the `-d` option.


**Logs**

Logs are created when compose goes up.
```
./logs/nwserverError1.txt
./logs/nwserverLog1.txt
```

**To stop the server for any reason**

```
$ cd /path/to/repo
$ docker-compose stop
```
_Note: `docker-compose down` can also be used but this can be destructive, so please use wisely and ensure all data is adequately backed up. If you're unsure, then stick to `docker-compose stop`._

**Build procedure**

After cloning run 

```
$ compile_module.bat
```

to assemble a new module.mod.

**Push procedure**

Decompile the module using

```
$ decompile_module.bat
```

then push on your fork and open a pull request