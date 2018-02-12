![pod_updater](https://github.com/hwzss/sketch_learning/blob/master/%E4%BD%9C%E5%93%812/%E6%B7%A1%E8%93%9D%E8%89%B2%E9%A3%8E%E6%A0%BC1.png)



# PodUpdater

iOS 开发中帮助您快速的将自己的开发的pod库代码上传到 git ，并帮你 push 到 podspec repo 库去
使用方式： cd 到你的 pod 库代码目录，然后执行'pod_updater -v [new_version]'，然后就可以去喝杯茶了

## 如何安装

在 shell 输入下面命令

    $ gem install pod_updater

## 使用

cd 到你的 podspec 所在的目录路径，如：

```

cd ~/Desktop/my_private_pod/my_first_pod
    
```
然后输入下面命令： 

```
pod_updater -v 1.0.1
```

下面是一些我在使用时，shell里输入的命令

```
qwkdeMacBook-Pro-2:~ qwk$ cd ~/Documents/WZ_GitHub/WZ_HelloKit 

qwkdeMacBook-Pro-2:WZ_HelloKit qwk$ pod_updater -v 3.0.0

```



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).




