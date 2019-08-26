@echo off
docker run --rm -it -v "%cd%:/home/devbase/build" jakkn/nwn-devbase extract
PAUSE
