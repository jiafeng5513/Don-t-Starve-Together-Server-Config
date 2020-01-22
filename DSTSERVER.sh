#!/bin/bash
#-------------------------------------------------------------------------------------------
#欲醉无由 2016.11.12                                                                          
#-------------------------------------------------------------------------------------------
function SetWhite()
{
	echo "============================================"
	echo "[1]加入白名单 [2]放出白名单 "
	read white1
	case $white1 in
	1)
	echo "============================================"
	echo "请输入要加入白名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ ! `grep "$ID2" whitelist.txt` ]]
		then 
			echo "$ID2" >> whitelist.txt
			echo "已为这个玩家预留一个位置"
		else
			echo "这个玩家已经有一个位置"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	;;
	2)
	echo "============================================"
	echo "请输入要解除白名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ `grep "$ID2" whitelist.txt` ]]
		then 
			sed -i "/$ID2/d" whitelist.txt
			cd $HOME
			echo "预留位置已开放"
		else
			echo "没有这个玩家的预留位置"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	;;
	esac
	Main
}
function SetBlack()
{
echo "============================================"
	echo "[1]加入黑名单 [2]放出黑名单 "
	read black1
	case $black1 in
	1)
	echo "============================================"
	echo "请输入要加入黑名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ ! `grep "$ID2" blacklist.txt` ]]
		then 
			echo "$ID2" >> blacklist.txt
			echo "SB已被关入地上小黑屋"
		else
			echo "这个SB已经在小黑屋"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves/save
		if [[ ! `grep "$ID2" blacklist.txt` ]]
		then 
			echo "$ID2" >> blacklist.txt
			echo "SB已被关入地下小黑屋"
		else
			echo "这个SB已经在小黑屋"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	2)
	echo "============================================"
	echo "请输入要解除黑名单的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ `grep "$ID2" blacklist.txt` ]]
		then 
			sed -i "/$ID2/d" blacklist.txt
			cd $HOME
			echo "已放出地上小黑屋"
		else
			echo "这个玩家不在小黑屋"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves/save
		if [[ `grep "$ID2" blacklist.txt` ]]
		then 
			sed -i "/$ID2/d" blacklist.txt
			cd $HOME
			echo "已放出地下小黑屋"
		else
			echo "这个玩家不在小黑屋"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	esac
	Main
}
function SetAdmin()
{	
	echo "============================================"
	echo "[1]提升管理员 [2]解除管理员 "
	read admin1
	case $admin1 in
	1)
	echo "============================================"
	echo "请输入要提升管理员的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ ! `grep "$ID2" adminlist.txt` ]]
		then 
			echo "$ID2" >> adminlist.txt
			echo "地上管理员已设置"
		else
			echo "这个玩家已经是管理员"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves/save
		if [[ ! `grep "$ID2" adminlist.txt` ]]
		then 
			echo "$ID2" >> adminlist.txt
			echo "地下管理员已设置"
		else
			echo "这个玩家已经是管理员"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	2)
	echo "============================================"
	echo "请输入要解除管理员的Klei ID"
	read ID2
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master/save
		if [[ `grep "$ID2" adminlist.txt` ]]
		then 
			sed -i "/$ID2/d" adminlist.txt
			cd $HOME
			echo "地上管理员已移除"
		else
			echo "这个玩家不是管理员"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves/save ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves/save
		if [[ `grep "$ID2" adminlist.txt` ]]
		then 
			sed -i "/$ID2/d" adminlist.txt
			cd $HOME
			echo "地下管理员已移除"
		else
			echo "这个玩家不是管理员"
		fi
	else
		echo "该存档没有地下世界"
	fi
	;;
	esac
	Main
}
function Listmanage()
{
echo "============================================"
echo "存档目录"
	cd $HOME
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要管理Mod的存档代码"
	read filenumber
while :
do
	echo "============================================"
	echo "[1]设置管理员 [2]管理黑名单 [3]管理白名单"
	read list1
	case $list1 in
		1)SetAdmin
		break;;
		2)SetBlack
		break;;
		3)SetWhite
		break;;
	esac
done
}
function RemMod()
{
while :
do
	echo "============================================"
	echo "请输入要移除的modID（返回主菜单输入0）"
	read ID1
	case $ID1 in
		0)break;;
		*)
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Master
		if [[ `grep "$ID1" modoverrides.lua` ]]
		then 
			sed -i "/$ID1/d" modoverrides.lua
			cd $HOME
			echo "地上世界Mod移除完成"
		else
			echo "地上世界该Mod不存在"
		fi
	else
		echo "该存档没有地上世界"
	fi
	cd $HOME
	if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
	then
		cd ./.klei/DoNotStarveTogether/$filenumber/Caves
		if [[ `grep "$ID1" modoverrides.lua` ]]
		then 
			sed -i "/$ID1/d" modoverrides.lua
			cd $HOME
			echo "地下世界Mod移除完成"
		else
			echo "地下世界该Mod不存在"
		fi
	else
		echo "该存档没有地下世界"
	fi
	esac
done
Main
}
function AddMod()
{
while :
do
	echo "============================================"
	echo "请输入要添加的modID（返回主菜单输入0）"
    read ID1
	case $ID1 in
		0)break;;
		*)
			if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
			then
				cd ./.klei/DoNotStarveTogether/$filenumber/Master
				if [[ ! `grep "$ID1" "modoverrides.lua"` ]]
				then 
					sed -i '$d' modoverrides.lua
					echo "[\"workshop-$ID1\"]={ configuration_options={  }, enabled=true }," >> modoverrides.lua
					echo "}" >> modoverrides.lua
					cd $HOME
					mod3=1
					echo "地上世界Mod添加完成"
				else
					echo "地上世界该Mod已存在"
				fi
			else
				echo "该存档没有地上世界"
				mod3=0
			fi
			cd $HOME 
			if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
			then
				cd ./.klei/DoNotStarveTogether/$filenumber/Caves
				if [[ ! `grep "$ID1" modoverrides.lua` ]]
				then 
					sed -i '$d' modoverrides.lua
					echo "[\"workshop-$ID1\"]={ configuration_options={  }, enabled=true }," >> modoverrides.lua
					echo "}" >> modoverrides.lua
					cd $HOME
					mod4=$[mod3+1]
					echo "地下世界Mod添加完成"
				else
					echo "地下世界该Mod已存在"
				fi
			else
				echo "该存档没有地下世界"
				mod4=$[mod3+0]
			fi
			cd "./Steam/steamapps/common/Don't Starve Together Dedicated Server/mods"
				if [[ ! `grep "$ID1" dedicated_server_mods_setup.lua` ]]
				then        
					echo "ServerModSetup(\"$ID1\")" >> dedicated_server_mods_setup.lua
				fi
			cd "$HOME"
			case mod4 in
				0)  echo "该存档不存在"
				;;
				*)
				;;
			esac
			echo "$mod4"
	esac
done
Main
}
function Modmanage()
{
echo "============================================"
echo "存档目录"
	cd $HOME
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要管理Mod的存档代码"
	read filenumber
while :
do
echo "============================================"
echo "[1]添加Mod [2]移除Mod [3]清空MOD（慎用）"
read mod1
	case $mod1 in
		1)AddMod
		break;;
		2)RemMod
		break;;
		3)echo "请再次输入要清空Mod的存档代码"
		  read filenumber
		  if [ -d ./.klei/DoNotStarveTogether/$filenumber/Master ]
		  then 
		  echo "return {
				 }" > ./.klei/DoNotStarveTogether/$filenumber/Master/modoverrides.lua
		  fi
		  if [ -d ./.klei/DoNotStarveTogether/$filenumber/Caves ]
		  then 
		  echo "return {
				 }" > ./.klei/DoNotStarveTogether/$filenumber/Caves/modoverrides.lua
		  fi
		  echo "Mod已清空"
		break;;
	esac	
done
}
function Delete()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}' 
	echo "请输入要删除的存档代码"
	read filenumber
		cd "./.klei/DoNotStarveTogether"
		if [ -d $filenumber/Master/save ]
		then
		rm -r $filenumber/Master/save
		fi
		if [ -d $filenumber/Caves/save ]
		then
		rm -r $filenumber/Caves/save
		fi
		echo "存档已删除"
		if [ -f "${filenumber}.tar.gz" ] 
		then
			echo "是否删除备份？[y/n]"
			read delbackup1
				case delbackup1 in
					1)rm ${filenumber}.tar.gz
					echo "备份已删除"
					;;
					2)
					;;
				esac
		fi
		cd $HOME
		Filemanage
}
function Recovery()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}' 
	echo "请输入要恢复的存档代码"
	read filenumber 
		cd "./.klei/DoNotStarveTogether"
		if [ -f "${filenumber}.tar.gz" ]
		then
			echo "存档已找到，正在恢复"
			if [ -d "$filenumber" ]
			then
				rm -r $filenumber
			fi
			tar -zxf ${filenumber}.tar.gz $filenumber
			echo "存档已恢复"
		else
			echo "存档未找到"
		fi
		cd $HOME
		Filemanage
			
}
function Backup()
{
	echo "============================================"
	echo "存档目录"
	ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
	echo "请输入要备份的存档代码"
	read filenumber
		cd "./.klei/DoNotStarveTogether"
		if [ -d "$filenumber" ]
		then
			if [ ! -f "${filenumber}.tar.gz" ]
			then
				tar -zcf ${filenumber}.tar.gz $filenumber
				echo  "备份成功"
			else
			echo "备份已存在，是否覆盖？[y/n]"
				read backup2
				case $backup2 in
					y)tar -zcf ${filenumber}.tar.gz $filenumber
					  echo  "备份成功"
					  cd $HOME
					  Filemanage
					;;
					n)cd $HOME
					  Filemanage
				esac
			fi
		else 
			echo "该存档不存在"
		fi
		cd $HOME
		Filemanage
}
function Filemanage()
{
	echo "============================================"
	echo "[1]备份存档 [2]恢复存档 [3]删除存档"
	read filemanage1
		case $filemanage1 in
			1)Backup
			;;
			2)Recovery
			;;
			3)Delete
			;;
			*)echo "指令无效";Filemanage
		esac

}
function StartCaves()
{
	echo "#!/bin/bash

	gamesPath=\"Steam/steamapps/common/Don't Starve Together Dedicated Server/bin\"
	cd \"\$HOME\"
	cd \"\$gamesPath\"
	run_shared=(./dontstarve_dedicated_server_nullrenderer)
	run_shared+=(-console)
	run_shared+=(-cluster "$filenumber")
	run_shared+=(-monitor_parent_process $)
	
	\"\${run_shared[@]}\" -shard Caves" > ./.klei/DoNotStarveTogether/$filenumber/startcaves.sh
	cd ./.klei/DoNotStarveTogether/$filenumber
	chmod u+x ./startcaves.sh
	cd $HOME
	screen -S "Caves Server $filenumber" "./.klei/DoNotStarveTogether/$filenumber/startcaves.sh"
}
function StartMaster()
{
	echo "#!/bin/bash

	gamesPath=\"Steam/steamapps/common/Don't Starve Together Dedicated Server/bin\"
	cd \"\$HOME\"
	cd \"\$gamesPath\"
	run_shared=(./dontstarve_dedicated_server_nullrenderer)
	run_shared+=(-console)
	run_shared+=(-cluster "$filenumber")
	run_shared+=(-monitor_parent_process $)
	
	\"\${run_shared[@]}\" -shard Master" > ./.klei/DoNotStarveTogether/$filenumber/startmaster.sh
	cd ./.klei/DoNotStarveTogether/$filenumber
	chmod u+x ./startmaster.sh
	cd $HOME
	screen -S "Master Server $filenumber" "./.klei/DoNotStarveTogether/$filenumber/startmaster.sh"
}
function Serversetting2()
{

while :
do
    echo "请选择模式：1.无尽 2.生存 3.荒野"
    read gamemode1
    case $gamemode1 in
        1)
        gamemode1="endless"
        break;;
        2)
        gamemode1="survival"
        break;;
        3)
        gamemode1="wilderness"
        break;;
    esac
done

echo "请输入最大玩家数量："
read players

while :
do
    echo "是否开启pvp？[y/n]"
    read ifpvp
    case $ifpvp in
        y)
        ifpvp="true"
        break;;
        n)
        ifpvp="false"
        break;;
    esac
done

while :
do
    echo "是否开启暂停？[y/n]"
    read ifpause
    case $ifpause in
        y)
        ifpause1="true"
        break;;
        n)
        ifpause1="false"
        break;;
    esac
done

while :
do
    echo "请选择游戏难度：1.休闲 2.合作 3.竞赛 4.疯狂"
    read intention
    case $intention in
        1)
        intention1=social
        break;;
        2)
        intention1=cooperative
        break;;
        3)
        intention1=competitive
        break;;
        4)
        intention1=madness
        break;;
    esac
done

while :
do
    echo "控制台是否打开？[y/n]"
    read console
    case $console in
        y)
        console1="true"
        break;;
        n)
        console1="false"
        break;;
    esac
done
echo "请输入你的饥荒令牌："
read token

echo "$token" > ./.klei/DoNotStarveTogether/$filenumber/cluster_token.txt

echo "请输入服务器名字："
read servername
	
echo "请输入服务器介绍：PS：若无请按Enter键"
read description

echo "请输入服务器密码：PS：若无请按Enter键"
read password

echo "请输入地上世界服务器外网IP:"
read masterip

 echo "[GAMEPLAY]
game_mode = $gamemode1
max_players = $players
pvp = $ifpvp
pause_when_empty = $ifpause1


[NETWORK]
cluster_description = $description
cluster_name = $servername
cluster_intention = $intention1
cluster_password = $password


[MISC]
console_enabled = $console1


[SHARD]
shard_enabled = true
bind_ip = 0.0.0.0
master_ip = $masterip
master_port = 10889
cluster_key = supersecretkey" > ./.klei/DoNotStarveTogether/$filenumber/cluster.ini
clear
echo "服务器配置完成！"
}
function Serversetting1()
{
while :
do
    echo "请选择模式：1.无尽 2.生存 3.荒野"
    read gamemode
    case $gamemode in
        1)
        gamemode1="endless"
        break;;
        2)
        gamemode1="survival"
        break;;
        3)
        gamemode1="wilderness"
        break;;
    esac
done

echo "请输入最大玩家数量："
read players

while :
do
    echo "是否开启pvp？[y/n]"
    read ifpvp
    case $ifpvp in
        y)
        ifpvp="true"
        break;;
        n)
        ifpvp="false"
        break;;
    esac
done

while :
do
    echo "是否开启暂停？[y/n]"
    read ifpause
    case $ifpause in
        y)
        ifpause1="true"
        break;;
        n)
        ifpause1="false"
        break;;
    esac
done

while :
do
    echo "请选择游戏难度：1.休闲 2.合作 3.竞赛 4.疯狂"
    read intention
    case $intention in
        1)
        intention1=social
        break;;
        2)
        intention1=cooperative
        break;;
        3)
        intention1=competitive
        break;;
        4)
        intention1=madness
        break;;
    esac
done

while :
do
    echo "控制台是否打开？[y/n]"
    read console
    case $console in
        y)
        console1="true"
        break;;
        n)
        console1="false"
        break;;
    esac
done
echo "请输入你的饥荒令牌："
read token

echo "$token" > ./.klei/DoNotStarveTogether/$filenumber/cluster_token.txt

echo "请输入服务器名字："
read servername
	
echo "请输入服务器介绍：PS：若无请按Enter键"
read description

echo "请输入服务器密码：PS：若无请按Enter键"
read password

 echo "[GAMEPLAY]
game_mode = $gamemode1
max_players = $players
pvp = $ifpvp
pause_when_empty = $ifpause1


[NETWORK]
cluster_description = $description
cluster_name = $servername
cluster_intention = $intention1
cluster_password = $password


[MISC]
console_enabled = $console1


[SHARD]
shard_enabled = true
bind_ip = 127.0.0.1
master_ip = 127.0.0.1
master_port = 10889
cluster_key = supersecretkey" > ./.klei/DoNotStarveTogether/$filenumber/cluster.ini
clear
echo "服务器配置完成！"
}
function CreatCavesini()
{
echo "[NETWORK]
server_port = 11001


[SHARD]
is_master = false
name = Caves


[STEAM]
master_server_port = 27019
authentication_port = 8769" > ./.klei/DoNotStarveTogether/$filenumber/Caves/server.ini
echo "return {
override_enabled = true,
preset = \"DST_CAVE\",
}" > ./.klei/DoNotStarveTogether/$filenumber/Caves/worldgenoverride.lua
echo "return {
}" >> "./.klei/DoNotStarveTogether/$filenumber/Caves/modoverrides.lua"
}
function CreatMasterini()
{
echo "[NETWORK]
server_port = 11000

[SHARD]
is_master = true

[STEAM]
master_server_port = 27018
authentication_port = 8768" > ./.klei/DoNotStarveTogether/$filenumber/Master/server.ini
echo "return {
}" >> "./.klei/DoNotStarveTogether/$filenumber/Master/modoverrides.lua"
}
function Cavesfile()
{
echo "============================================"
echo "请输入存档代码"
read filenumber
	if [ ! -d "./klei/DoNotStarveTogether/$filenumber" ]
	then 
		mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Caves
	fi
CreatCavesini
Serversetting2
StartCaves
}
function Masterfile()
{
echo "============================================"
echo "请输入存档代码"
read filenumber
	if [ ! -d "./klei/DoNotStarveTogether/$filenumber" ]
	then 
		mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Master
	fi
CreatMasterini
Serversetting2
StartMaster
}
function MasterCaves()
{
echo "============================================"
while :
do
echo "[1]地上 [2]地下"
read masterCaves1
	case $masterCaves1 in
		1)Masterfile
		break;;
		2)Cavesfile
		break;;
	esac
done
}
function Filechose()
{ 
	if [  -d "./.klei/DoNotStarveTogether/$filenumber/Master" ]; then
		zzz=1
	else
		zzz=0
	fi
	if [ -d "./.klei/DoNotStarveTogether/$filenumber/Caves" ] ; then
		zz=$[zzz+2]
	else
		zz=$[zzz+4]
	fi
	case $zz in
			2)StartCaves
			;;
			3)StartMaster;StartCaves;
			;;
			4)echo "存档没有内容，是否新建？[y/n]"
			  read newfile1
			  case $newfile1 in
				y)Modechose
				;;
				n)Main
			  esac
			;;
			5)StartMaster
			;;
	esac
}
function Newfile()
{ 
mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Master
mkdir -p ./.klei/DoNotStarveTogether/$filenumber/Caves
Serversetting1
CreatMasterini
CreatCavesini
StartMaster
StartCaves
}
function Startserver()
{
echo "============================================"
echo "存档目录"
ls -l ./.klei/DoNotStarveTogether |awk '/^d/ {print $NF}'
echo "============================================"
echo "请输入存档代码"
read filenumber
	if [ -d "./.klei/DoNotStarveTogether/$filenumber" ]
	then 
		Filechose
	else
		echo "存档不存在，是否新建？[y/n]" 
		read newfile2
		while :
		do
			case $newfile2 in
				y)Modechose
				break;;
				n)Main
				break;;
			esac
		done
	fi
}
function CloseServer()
{
echo "============================================"
screen -ls
echo "============================================"
echo "输入要切换的PID"
echo "PS:回车后会进入地上或地下的运行界面"
echo "   手动输入c_shutdown(true)回车保存退出"
echo "   进入后不想关闭请按ctrl+a+d"
read pid1
screen -r $pid1

}
function Modechose()
{
echo "============================================"
while :
do
echo "[1]单服务器搭建 [2]双服务器搭建 "
	read servermode
	case $servermode in
		1)Newfile
		break;;
		2)MasterCaves
		break;;
	esac
done	
}
function Gameupdate()
{
		cd ./steamcmd
	./steamcmd.sh +login anonymous +app_update 343050 validate +quit
	cd "$HOME"
	clear
	echo "更新完毕"
	Main
}
function Library()
{
	 apt-get -y update
	 apt-get -y install screen
	 apt-get -y install lib32gcc1
	 apt-get -y install lib32stdc++6
	 apt-get -y install libcurl4-gnutls-dev:i386
	 apt-get -y install htop
}
function Prepare()
{
if [ ! -d "./steamcmd" ]
then
Library
mkdir ./steamcmd
cd ./steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
rm -f steamcmd_linux.tar.gz
./steamcmd.sh +login anonymous +app_update 343050 validate +quit
fi
cd "$HOME"
}
function Main()
{
echo "============================================"
while :
do
echo "[1]更新服务器 [2]启动服务器 [3]关闭服务器"
echo "[4]管理存档   [5]管理MOD    [6]管理特殊名单"
echo 
	read main1
		case $main1 in
			1)Gameupdate
			break;;
			2)Startserver
			break;;
			3)CloseServer
			break;;
			4)Filemanage
			break;;
			5)Modmanage
			break;;
			6)Listmanage
			break;;
		esac
done
}

echo "欢迎使用"
Prepare
echo "准备完毕"
echo "============================================"
Main
