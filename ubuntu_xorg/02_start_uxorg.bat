
::docke container run -it --rm -e USER_ID=$UID -v D:\wsl\share\iclab:/work -w /work ubuntu-xorg:20.04

::docker run -it -p 5901:5901 -p 1201:22 -w /root --hostname wisen --mac-address 02:42:ac:11:00:02 -v D:\wsl\share\synopsys2016:/mnt/mydata phyzli/ubuntu18.04_xfce4_vnc4server_synopsys2016:env1214

docker run -it -p 5909:5901 -p 1209:22 -w /work --hostname wisen --name wisen_uxorg_2004 --mac-address 02:42:ac:11:00:02 -v D:\wsl\share\iclab:/work ubuntu-xorg:20.04
