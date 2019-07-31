# 设计模式

## 简介

书名：Design Patterns - Elements of Reusable Object-Oriented Software（中文译名：设计模式 - 可复用的面向对象软件元素），四作者简称GOF，四人帮

### 类型：

总共23种设计模式

三类：创建型模式（Creational Patterns）、结构型模式（Structural Patterns）、行为型模式（Behavioral Patterns）

创建型模式：

1. 工厂模式（Factory Pattern）
2. 抽象工厂模式（Abstract Factory Pattern）
3. 单例模式（Singleton Pattern）
4. 建造者模式（Builder Pattern）
5. 原型模式（Prototype Pattern）

结构型模式：

1. 适配器模式（Adapter Pattern）
2. 桥接模式（Bridge Pattern）
3. 组合模式（Composite Pattern）
4. 装饰器模式（Decorator Pattern）
5. 外观模式（Facade Pattern）
6. 享元模式（Flyweight Pattern）
7. 代理模式（Proxy Pattern）

行为型模式：

1. 责任链模式（Chain of Responsibility Pattern）
2. 命令模式（Command Pattern）
3. 解释器模式（Interpreter Pattern）
4. 迭代器模式（Iterator Pattern）
5. 中介者模式（Mediator Pattern）
6. 备忘录模式（Memento Pattern）
7. 观察者模式（Observer Pattern）
8. 状态模式（State Pattern）
9. 策略模式（Strategy Pattern）
10. 模板模式（Template Pattern）
11. 访问者模式（Visitor Pattern）

##### 六大原则：

开闭原则：实现热插拔，提高扩展性; 在程序需要进行拓展的时候，不能去修改原有的代码。

里氏代换原则：实现抽象的规范，实现子父类互相替换；任何基类可以出现的地方，子类一定可以出现。LSP 是继承复用的基石，只有当派生类可以替换掉基类，且软件单位的功能不受到影响时，基类才能真正被复用，而派生类也能够在基类的基础上增加新的行为。

依赖倒转原则：针对接口编程，实现开闭原则的基础；依赖于抽象而不依赖于具体。

接口隔离原则：降低耦合度，接口单独设计，互相隔离；

迪米特法则，又称不知道原则：功能模块尽量独立；

合成复用原则：尽量使用聚合，组合，而不是继承；







> <https://www.runoob.com/design-pattern/design-pattern-intro.html>