#/bin/sh

# Install SteamCMD
mkdir /home/container/steamcmd && wget -P /home/container/steamcmd https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar xvf /home/container/steamcmd/steamcmd_linux.tar.gz -C /home/container/steamcmd

/home/container/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/container +app_update 598850 validate +quit

cd /home/container
mv GameServer_example.ini GameServer.ini

if [ ! -z "$ServerName" ]; then
    sed -i "s/Hellion Game Server/${ServerName}/g" GameServer.ini
fi
if [ ! -z "$SERVER_PORT" ]; then
    sed -i "s/6004/${SERVER_PORT}/g" GameServer.ini
fi
if [ ! -z "$StatusPort" ]; then
    sed -i "s/6005/${StatusPort}/g" GameServer.ini
fi

wine HELLION_Dedicated.exe