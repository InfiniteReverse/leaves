# OC 泛型 \_\__covariant 与\_\_contravariant

经常忘记这俩意思，记录一下

**__covariant**意为**协变**，意思是指**子类可以强制转转换为(超类)父类**，遵从的是[SOLID](https://www.jianshu.com/p/e903b67468b8)中的**L**即[**里氏替换原则**](https://link.jianshu.com/?t=https://zh.wikipedia.org/wiki/%E9%87%8C%E6%B0%8F%E6%9B%BF%E6%8D%A2%E5%8E%9F%E5%88%99)，大概可以描述为： **程序中的对象应该是可以在不改变程序正确性的前提下被它的子类所替换的[1]**
**__contravariant**意为**逆变**，意思是指**父类可以强制转为子类**。

