Windows下设置Emacs的HOME目录
 你可以在Emacs中输入C-x C-f，然后打开路径~（即当前的home环境变量所指的路径，一般来说是这样的路径：C:/Documents and Settings/water/Application Data）。

看看显示的是哪个目录，如果此目录下没有.emacs，可以创建一个.emacs或_emacs，然后在这个.emacs文件里，加入如下语句：
```
(load-file "E:/water/.emacs")
```
文件 E:/water/.emacs 才是我们真正的Emacs配置文件，我们可以在这个真正的配置文件里用如下语句设置我们的home目录：
```
(setenv "HOME" "E:/water")
(setenv "PATH" "E:/water")
;;set the default file path
(setq default-directory "~/")
(add-to-list 'load-path "~/emacs/site-lisp")
```
这个方法的优点是比较简单同样也方便对.emacs文件备份，不会对其它应用程序产生任何影响。 
