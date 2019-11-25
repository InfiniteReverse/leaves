# struct和class的区别

swift 中的 struct 与 class 在功能上比其他语言更接近，所以容易混淆。

相同点：

1. 定义property
2. 定义methods
3. 定义下标且支持对其值的访问
4. 定义initializer
5. 支持extension
6. 支持protocol

区别

1. class是引用类型；struct是值类型

2. struct分配在栈，class在堆

3. let修饰struct实例，修改属性时会报错，是immutable即不可变的

4. struct在function里面需要修改property时需要添加`mutating`修饰，class不用

5. class支持Deinitializers；struct不支持

6. class不支持初始化把property放在默认的构造器里面，struct支持

   ```
   let t = TestClass()// class 不能直接用 ClassCoder(name:"CJ",age:18) 必需要自己创建构造函数才可以
   var ts = TestStruct(name:"test", age:20)
   ```
   
7. class支持继承；struct不支持

8. class支持Type casting，即运行时检查和解释实例的类型；struct不支持



struct优点：

1. 安全，struct是深拷贝，没有引用计数
2. 内存，不会有内存泄露
3. 速度，在栈里，比较快
4. 线程安全



struct缺点：

1. oc与swift混合开发，oc调用swift代码必须继承NSObject
2. NSUserDefaults，struct不能被序列化成NSData对象






> https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
>
> https://juejin.im/post/5c622d6d6fb9a049dd80c455

