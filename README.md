饥荒联机版搭建私有服务器
================
#### FBI WARNING:
#### 附带的文件不能直接使用,其中的Token,服务器名,密码,管理员账户名都已经打码,请替换.


1. 获取Token
   启动界面->Account->游戏->饥荒联机版的游戏服务器->取一个服务器名字->获得服务器Token<br>
   形如:`pds-g^KU_XXXXXXXXXXXXX************XXXXXXXXXXXXXXXXX`.<br>
2. 给DSTSERVER.sh授权(777),并运行,脚本会开始下载Steam和游戏.<br>
3. 显示`准备完毕`,输入1,更新.<br>
4. 装依赖
   ``` bash
   sudo dpkg --add-architecture i386; sudo apt update; sudo apt install mailutils postfix curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386
   ```
5. 几个关键的路径
   1. `~/.klei/`<br>
    里面有`/DoNotStarveTogether/`,这是存储存档的路径.<br>
   2. `~/.steam/`<br>
    和本文无关.<br>
   3. `~/Steam/`<br>
    类似Windows上的Steam存储库,`~/Steam/steamapps/common/`里面是steam下载的游戏.<br>
   4. `[脚本所在路径]/steamcmd/`<br>
    里面有`steamcmd.sh`,不需要更改.<br>
6. 世界设定和服务器端mod.<br>
    1. 本地启动游戏建立服务器,调整世界设置,启用想用的服务器端Mod,注意服务器的名字要和获取Token时选取的名字一致.<br>
    2. 找到本地的`/.klei/`,把刚刚生成的世界存档拷贝出来.<br>
    3. 存档的结构是这样的:
        ```C
        |---Caves    //洞穴
        |     |---leveldataoverride.lua  //资源设置
        |     |---modoverrides.lua       //mod配置文件
        |     |---server.ini             //服务器配置
        |     |---server_chat_log.txt    
        |     |---server_log.txt
        |---Master   //地表
        |     |---leveldataoverride.lua  //资源设置
        |     |---modoverrides.lua       //mod配置文件
        |     |---server.ini             //服务器配置
        |     |---server_chat_log.txt
        |     |---server_log.txt
        |---adminlist.txt                //管理员KleiID
        |---cluster.ini      //玩家人数,服务器名字,密码,服务器性质等
        |---cluster_token.txt            //Klei服务器token
        |---startcaves.sh
        |---startmaster.sh
        ```
    4. 补充缺少的文件<br>
       * `adminlist.txt `:一行一个KleiID,形如`KU_XXXXXXXX`,用户登录的时候服务器的log会显示出他的KleiID.<br>
       * `cluster_token.txt`:开头获取的ID.<br>
7. mod下载脚本.<br>
   1. 打开`modoverrides.lua`.<br>
   洞穴和地表这个文件是一样的.这个文件里面有许多形如`"workshop-362175979"`的字符串,后面的数字是mod的ID,把这些ID记下来<br>
   1. `编写dedicated_server_mods_setup.lua`<br>
        这个文件里面是这样的:<br>
        ```lua
        ServerModSetup("374550642")     
        ServerModSetup("362175979")
        ServerModSetup("375859599")
        ```
        每行一条,引号里面的是上一步记录的MOD的ID.<br>
8. 上传文件
   1. 把第6步编辑好的存档上传到服务器的 `~/.klei/DoNotStarveTogether/`下.<br>
   2. 把第7步编写的脚本上传到`~/Steam/steamapps/common/Don't Starve Together Dedicated Server/mods/`.这个目录也是mod的存储目录,这里也可以从本地把对应的mod文件夹上传过来,如果不上传mod文件夹,服务器启动的时候也会自动根据脚本下载<br>
9. 启动服务
   1.  运行`DSTSERVER.sh`,按照提示操作即可.<br>
   2.  Ctrl+A+C把服务挂到后台,此时关闭终端也不会终止服务程序的运行.<br>
10. 管理员可以在游戏内部进行一些操作
    1.  按~键呼出控制台.<br>
    2.  按TAB键弹出服务管理UI,可以进行世界的重置,查看信号强度,踢人等操作.<br>
11. 内部控制台命令请看`./cmd.md`
12. 参考文献
    1. [Steam饥荒联机版云服搭建教程——Windows篇(B站视频)](https://www.bilibili.com/video/av45215129)
    2. [饥荒控制台作弊代码详解](https://mp.weixin.qq.com/s?src=3&timestamp=1579666176&ver=1&signature=NLoaZYHWg8B7pynVt73S3io*r5ZeSlikBnYUjITkt2J3bwSz0zixejZREEwB6ycd-vCFJ137qSitE-dwxcyEQtnSh7J3i5Vn0870JbzjmIoMPztWzNl5UBJdmOu3peZqoq671oEtProYXqY9Su1KxNwM9nxHG6G-j*4NpkSiQHI=)
    3. [饥荒物品代码](https://pc.tgbus.com/xinde_181/94484/)
    4. [Linux自建steam饥荒服务器教程](https://blog.csdn.net/qq_35543890/article/details/81257937)
    5. [饥荒联机版服务器搭建教程](https://www.jianshu.com/p/440d64cd3ac4)