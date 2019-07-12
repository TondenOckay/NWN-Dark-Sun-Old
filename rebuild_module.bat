@echo off
docker run --rm -it -v "%cd%:/home/devbase/build" -a stdin -a stdout -a stderr --entrypoint /bin/sh jakkn/nwn-devbase -c "cd /home/devbase/build && nwn-build clean && cd /home/devbase/build/src/nss/ && nwn-build compile * && cp -rv *.nss /home/devbase/build/.nwnproject/cache/gff && cd /home/devbase/build/ && nwn-build pack"
PAUSE
