# AutoreleasePool总结

### AutoreleasePool是什么

### AutoreleasePool原理



### Autorelease对象什么时候释放？

在没有手加Autorelease Pool的情况下，Autorelease对象是在当前的`runloop`迭代结束时释放的，而它能够释放的原因是**系统在每个runloop迭代中都加入了自动释放池Push和Pop**

### 对象的释放时间

1. 调用 -release ：引用计数变为零

- 对象正在被销毁，生命周期即将结束.
- 不能再有新的 __weak 弱引用， 否则将指向 nil.
- 调用 [self dealloc]

2. 子类 调用 -dealloc

- 继承关系中最底层的子类 在调用 -dealloc
- 如果是 MRC 代码 则会手动释放实例变量们（iVars）
- 继承关系中每一层的父类 都在调用 -dealloc

3. NSObject 调 -dealloc

- 只做一件事：调用 Objective-C runtime 中的

4. object_dispose() 方法

- 调用 object_dispose()
- 为 C++ 的实例变量们（iVars）调用 destructors
- 为 ARC 状态下的 实例变量们（iVars） 调用 -release
- 解除所有使用 runtime Associate方法关联的对象
- 解除所有 __weak 引用
- 调用 free()