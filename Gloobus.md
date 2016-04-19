Gloobus is an extension of Gnome designed to enable a full screen preview of any kind of file.

Ever been annoyed by those tiny miniatures of your files that are helpless. Outraged by the fact that there's no miniature for half of the file formats you're using. Excruciated by the painful loading time to see if you're dealing with the right file?

Hail to Gloobus, for tis' is the Holy Grail of preview!
Designed as an extendable, standards-compliant previewer , so that it plays nice with Gnome and can be easily extended to support any kind of file, Gloobus enables instant previewing of your files, without even having to open them. Hit space, and BANG, here's the content of your file, displayed as it would if it was opened.

Currently, Gloobus supports MP3,TXT,PDF,JPG,PNG,TTF,MPG,OGG,WMV,AVI,Theora,cbz and cbr
It has a sleek black interface which will put your files in focus

Please spread the word on forums, on planets, on your blog. We need documentation writers, translators, programmers, hackers, evangelists.
If you don't have time to help, you can also...
  * show your support by [donating](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=guitarboy000%40gmail%2ecom&item_name=Gloobus%2c%20A%20Quicklook%20for%20linux&no_shipping=0&no_note=1&tax=0&currency_code=EUR&lc=US&bn=PP%2dDonationsBF&charset=UTF%2d8) a couple of €/£/$/whatever to the developpers.
  * vote for us on Ubuntu Brainstorm.
<p align='center'><a href='http://brainstorm.ubuntu.com/idea/111/'><img src='http://brainstorm.ubuntu.com/idea/111/image/1/?filetype=.png' /></a>
<ul><li>test Gloobus and <a href='https://bugs.edge.launchpad.net/gloobus'>report any bug</a> you may find.</li></ul>

Gloobus is a preview software that lets you view files so quickly witouth having to open them in their normal software. It's based on apple's "quicklook" and it has 2 main options. The coverflow effect for a folder and the preview window for the files.<br>
<br>
Install from a DEB 32/64bits:<br>
<a href='http://www.deviantart.com/download/122054947/Gloobus_Preview_0_03_2_by_JordiHP.gz'>http://www.deviantart.com/download/122054947/Gloobus_Preview_0_03_2_by_JordiHP.gz</a>


Install from bzr trunk<br>
<pre><code>sudo apt-get install bzr<br>
sudo apt-get install libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libsdl-gfx1.2-dev libmagic-dev<br>
sudo apt-get install libgtk2.0-dev libgvfscommon-dev libgstreamer-plugins-base0.10-dev libcairomm-1.0-dev libtag1-dev libpoppler-glib-dev <br>
bzr branch lp:gloobus/gloobus-0.03<br>
cd gloobus-0.03<br>
cd Gloobus-Preview<br>
make &amp;&amp; sudo make install &amp;&amp; sudo make plugins<br>
</code></pre>
In the bzr gloobus-preview/DATA there should be two images: close_button.png and gloobus_button.png.<br>
<br>
Copy them in /usr/share/gloobus:<br>
<pre><code>cd DATA<br>
sudo cp *.png /usr/share/gloobus/<br>
</code></pre>








<a href='http://gloobus.wordpress.com/'>Blog</a>

<a href='http://ubuntuforums.org/showthread.php?t=828774'>Ubuntuforums Thread</a>

<a href='http://sourceforge.net/projects/gloobus'>Screenshots</a>

<a href='http://www.youtube.com/profile_videos?user=badchoice'>Screencasts</a>

<a href='https://edge.launchpad.net/gloobus/+download'>Downloads</a>

<a href='http://www.getdeb.net/app/Gloobus'>Deb Package for Ubuntu</a>