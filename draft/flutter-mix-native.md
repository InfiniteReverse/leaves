# Flutter与Native混合

## 构建

### Plan A

根据官方文档，创建Flutter项目后，与原项目关联即可

1. 创建Flutter Module ，建立git仓库

2. 添加Flutter仓库到原项目submodule

3. `git submodule update`

4. 添加代码到Podfile

   ```
     flutter_application_path = 'path/to/my_flutter/'
     load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
   ```

5. Podfile内每一个target添加`install_all_flutter_pods(flutter_application_path)`

   ```
     target 'MyApp' do
       install_all_flutter_pods(flutter_application_path)
     end
     target 'MyAppTests' do
       install_all_flutter_pods(flutter_application_path)
     end
   ```

6. 执行`bundle exec fastlane #{build_lane}`



### Plan B

