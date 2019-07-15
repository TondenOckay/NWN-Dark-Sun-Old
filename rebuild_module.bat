@echo off
docker run --rm -it -v "%cd%:/home/devbase/build" -a stdin -a stdout -a stderr --entrypoint /bin/sh jakkn/nwn-devbase -c "cd /home/devbase/build && nwn-build clean && cd /home/devbase/build/src/nss/ && nwn-build compile * && cp -rv *.nss /home/devbase/build/.nwnproject/cache/gff && cd /home/devbase/build/ && nwn-build pack && nwn-erf -c -H -f server/hak/Dark_Sun.hak 2da/*.2da && nwn_tlk -i tlk/DS_cep+psion.csv -o server/tlk/DS_cep+psion.tlk"
PAUSE
