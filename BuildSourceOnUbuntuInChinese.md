# 引言 #
这是一篇帮助你从svn源代码编译gnome-globalmenu-applet的指南。这篇指南只适用于trunk(svn 500+)。


# 第1步: 获取源代码 #
这里假定你从trunk获取源代码。可以使用同样的方法从bransh、tag和其他地方获得代码。

```
svn checkout http://gnome2-globalmenu.googlecode.com/svn/trunk/ gnome-globalmenu
```

# 第2步: 获得必要的开发包 #
```
sudo apt-get build-dep libgtk2.0-0
sudo apt-get install xfce4-panel-dev
```

# 第3步: 编译并安装gnome-globalmenu #
```
cd gnome-globalmenu
dpkg-buildpackage -b -rfakeroot
cd ..
sudo dpkg -i gnome2-globalmenu-applet_0.4-1_i386.deb
```

# 第4步: 编译和安装使用gtk-aqd补丁的Gtk库 #
  * 获得Gtk源代码
```
cd trunk/gtk+-aqd/
apt-get source libgtk2.0-0
```

  * 给Gtk打补丁
    * Gusty版：
```
cd gtk+2.0-2.12.0
wget http://gnome2-globalmenu.googlecode.com/files/patch.diff.tar.bz2
tar jxvf patch.diff.tar.bz2 
patch -p1 < ./patch.diff
```
    * Hardy版：
> > > ` make patch `

  * 编译Gtk
```
dpkg-buildpackage -b -rfakeroot
```

  * 安装编译好的Gtk.
```
cd ..
sudo dpkg -i *.deb
```

  * 重新启动你的计算机.

# Step 5: 测试 #

> 如果没有遇到什么错误， 你安装的gtk已经打好补丁了。 在终端里运行一个普通的gtk程序，你可以看到一些debug信息。
```
....
Using GtkMenuBar.
....
```

> 右键单击面板，找到并添加Global Menubar。在终端里启动gedit测试Global Menubar是否工作。
```
GTK_MODULES=libgnomenu gedit
```

> 修改~/.gnomerc文件可以让Global Menubar重起后仍然运行。
```
gedit ~/.gnomerc
```
> 添加一行
    * **跳过** svn 833之后的版本请跳过此步。.
```
export GTK_MODULES=libgnomenu
```

# Setp 5: 删除 #
  * 删除 gnome-globalmenu-applet
```
sudo dpkg -r gnome2-globalmenu-applet
```

  * 重新安装默认的Gtk库.
> 检查你的update-manager, 选中重新安装Gtk相关的库.