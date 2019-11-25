# Runtime

- OC中的方法调用其实都是转成了objc_msgSend函数的调用，给receiver（方法调用者）发送了一条消息（selector方法名）
- objc_msgSend底层有3大阶段
- 消息发送（当前类、父类中查找）、动态方法解析、消息转发





![301129-a1159ef51f453da8](/Users/lizhengting/Desktop/301129-a1159ef51f453da8.jpg)

  



> https://www.jianshu.com/p/6ebda3cd8052



> 源码地址：https://opensource.apple.com/source/objc4/