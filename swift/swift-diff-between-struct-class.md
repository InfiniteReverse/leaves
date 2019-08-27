# struct和class的区别

swift 中的 struct 与 class 在功能上比其他语言更接近，所以容易混淆。

### 区别

相同点：

1. 定义property
2. 定义methods
3. 定义下标且支持对其值的访问
4. 定义initializer
5. 支持extension
6. 支持protocol

区别

1. class是引用类型；struct是值类型
2. class支持继承；struct不支持
3. class支持Type casting，即运行时检查和解释实例的类型；struct不支持
4. class支持Deinitializers；struct不支持
5. class实例可以有多个引用；struct不支持





> https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
>
> https://juejin.im/post/5c622d6d6fb9a049dd80c455

