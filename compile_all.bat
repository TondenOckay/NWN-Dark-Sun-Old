@echo off
docker run --rm -it -v "%cd%:/home/devbase/build" --entrypoint /bin/sh jakkn/nwn-devbase -c "cd /home/devbase/build && cd src/nss/ && nwn-build compile -v *"
PAUSE
