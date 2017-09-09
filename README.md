# myVim
该vim配置面向前端,linux window 通用

## 截图
![截图预览](http://p1.bqimg.com/567571/9933fca5e58de768.jpg)

## 面向语言:
- javascript
- css
- html5
- php

## 安装:
1. 克隆项目
```cmd
cd $HOME
git clone https://github.com/bluecat000/.vim.git
```
2. 创建vimrc文件

	- windows
	```cmd
	cp .vim\vimrc .
	rename vimrc _vimrc
	```
	- linux
	```cmd
	cp .vim/vimrc .
	mv vimrc .vimrc
	```
3. 安装vim-plug管理工具
[vim-plug](https://github.com/junegunn/vim-plug/)
4. 安装插件
```vim
:BundleInstall
```

##  Note
- 解决BundleSearch报错
```cmd
安装curl
```
- 解决ultisnip报错
需要添加py支持
