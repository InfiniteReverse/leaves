### OC调用Swift

1. 需要引入xcode自动生成的头文件 

   ```
    #import <SwiftPod/SwiftPod-Swift.h>
   ```

2. swift 类需要公开的属性和方法前加修饰词 `public`

3. swift 类需要被OC调用的属性和方法前加修饰词 `@objc`
### Swift调用OC

桥接文件 `#{projectName}-Bridging-Header.h`



### Swift framework package

由于cocoapods-packager官方近年没有更新，目前持续构建swift framework没有解决办法。

~~cocoapods-packager 目前最新1.5.0，该版本打包swift framework会报错，问题在`lib/cocoapods-packager/builder.rb` line 137，调用xcodebuild命令时target传值错误~~

~~源代码：~~

```ruby
 def build_sim_libraries(defines)
      if @platform.name == :ios
        xcodebuild(defines, '-sdk iphonesimulator', 'build-sim')
      end
 end
```

~~修改后：~~

```ruby
 def build_sim_libraries(defines)
      if @platform.name == :ios
        xcodebuild(defines, '-sdk iphonesimulator', 'build-sim', @spec.name.to_s)
      end
 end
```

~~打包命令：~~

```shell
bundle exec pod package SwiftPod.podspec --local --force --no-mangle --exclude-deps
```

打完后发现framework内部缺少 

1. ~~Modules文件夹，内部包含modulemap文件~~
2. ~~Headers文件加内缺少 SwiftPod-Swift.h   文件，该文件使OC可以调用Swift~~



~~脚本步骤：~~

1. ~~xcodebuild构建framework所需内容~~
2. ~~内部最终xcodebuild命令为(通过修改cocoapods-packager源码打印得出)：~~

  ```shell
  xcodebuild \
  GCC_PREPROCESSOR_DEFINITIONS='$(inherited) PodsDummy_Pods_SwiftPod=PodsDummy_PodPackage_SwiftPod'  \
  -sdk iphonesimulator \
  CONFIGURATION_BUILD_DIR=build \
  clean build \
  -configuration Release \
  -target SwiftPod \
  -project Pods/Pods.xcodeproj \
  2>&1
  ```