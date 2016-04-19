#summary Ubuntu Gusty/Hardy/Intrepid的安装指南
#labels installation
这只是一份草案文档，它可能会导致一些计算机故障。
# 引言 #
这份指南假定你没有在电脑上编译过其他程序，并且，假定你使用的是Ubuntu Intrepid。

**注意：如果你安装了旧版本的globalmenu，请首先将它们删除！**

## Intrepid使用PPA安装 ##
  * 添加下面的代码到/etc/apt/source.list
```
deb http://ppa.launchpad.net/globalmenu-team/ubuntu intrepid main
deb-src http://ppa.launchpad.net/globalmenu-team/ubuntu intrepid main
```
  * 获取升级信息
> > `sudo apt-get update`
  * 安装globalmenu
> > `sudo apt-get install gnome2-globalmenu`
  * 建立 ~/.gnomerc
> > `gedit ~/.gnomerc`
  * 在~/.gnomerc里添加环境变量
> > `export GTK_MODULES=globalmenu-gnome`
  * 重新启动你的电脑，右键单击面板，找到 **Global Menu Panel Applet** ，并且添加它。

## Intrepid删除 ##
  * 从面板上移出Global Menu Applet.
  * 删除globalmenu
> > `sudo apt-get remove gnome2-globalmenu`
  * 删除~/.gnomerc
  * 重启电脑

## Hardy/Gusty 使用apt repository安装 ##

  * 添加下面的代码到/etc/apt/source.list
> > `deb http://aeo.dreamhosters.com binary/`
  * 获取升级信息
> > `sudo apt-get update`
  * 安装globalmenu
> > `sudo apt-get install gnome2-globalmenu-applet`

## Hardy/Gusty 使用deb包安装 ##
### 32位系统 ###

  * 打开一个终端。
  * 新建一个文件夹。
> > ` mkdir global-menu-install`

  * 进入这个文件夹
> > ` cd global-menu-install`

  * 下载打过补丁的Gtk deb包和面板小程序
    * Gusty版：
> > ` wget http://gnome2-globalmenu.googlecode.com/files/gnome-globalmenu-0.4.2_ubuntu-gusty-svn679.tar.gz`
    * Hardy版：
> > `wget http://gnome2-globalmenu.googlecode.com/files/gnome-globalmenu-0.4-svn964.tar.gz`
  * 解压。
    * Gusty版：
> > > `tar zxvf gnome-globalmenu-0.4.2_ubuntu-gusty-svn679.tar.gz `
    * Hardy版：
> > > `tar zxvf gnome-globalmenu-0.4-svn964.tar.gz`


  * 安装。
    * Gusty版：
      1. `cd gnome-globalmenu `
      1. `sudo dpkg -i *.deb`
    * Hardy版：
      1. `cd globalmenu `
      1. `sudo dpkg -i *.deb`
    * **注意** 如果你在此处遇到包依赖关系错误错误，并且安装过老版本的globalmenu，请尝试卸载libgtk-directfb-2.0-0 libgtk-directfb-2.0-dev libgtk2.0-0-dbg libgtk2.0-dev，因为它们并不是默认安装。
> > > `sudo dpkg -r libgtk-directfb-2.0-0 libgtk-directfb-2.0-dev libgtk2.0-0-dbg libgtk2.0-dev`


> 如果你依然遇到问题，请尝试使用覆盖安装。
```
    sudo dpkg -i --force-overwrite *.deb 
```

  * 编辑 ~/.gnomerc文件 (仅Gusty版）
    * **注意** Hardy版请跳过此步。
> > 添加下列代码：
> > > `export GTK_MODULES=libgnomenu `

  * 重新启动你的电脑，右键单击面板，找到 **公用菜单小程序** ，并且添加它。

### 删除 gnome-globalmenu-applet ###
  * 删除面板上的applet
  * 打开终端
  * 删除gnome-globalmenu-appet
```
sudo dpkg -r gnome2-globalmenu-applet
```
  * 恢复成默认的Gtk库。
    * Gusty版：
```
sudo apt-get install libgtk2.0-0=2.12.0-1ubuntu3 gtk2-engines-pixbuf=2.12.0-1ubuntu3 gtk2.0-examples=2.12.0-1ubuntu3 libgtk2.0-dev=2.12.0-1ubuntu3 libgtk2.0-common=2.12.0-1ubuntu3
```
    * Hardy版：
```
sudo apt-get install libgtk2.0-0=2.12.9-3ubuntu3 gtk2-engines-pixbuf=2.12.9-3ubuntu3 gtk2.0-examples=2.12.9-3ubuntu3 libgtk2.0-common=2.12.9-3ubuntu3
```


### 64位系统 ###
目前暂时没有64位系统的deb包，有人向我们反映64位系统下存在编译错误。我们没有64位的系统去研究错误的具体原因。这里有一个源码[http://code.google.com/p/gnome2-globalmenu/wiki/BuildFromSource
编译指南]。
