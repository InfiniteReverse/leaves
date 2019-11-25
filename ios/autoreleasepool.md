# AutoreleasePool总结

### AutoreleasePool是什么

### AutoreleasePool原理



### Autorelease对象什么时候释放？

在没有手加Autorelease Pool的情况下，Autorelease对象是在当前的`runloop`迭代结束时释放的，而它能够释放的原因是系统在每个runloop迭代中都加入了自动释放池Push和Pop

- App启动后，苹果在主线程 RunLoop 里注册了两个 Observer，其回调都是 _wrapRunLoopWithAutoreleasePoolHandler()。
- 第一个 Observer 监视的事件是 Entry(即将进入Loop)，其回调内会调用 _objc_autoreleasePoolPush() 创建自动释放池。其 order 是-2147483647，优先级最高，保证创建释放池发生在其他所有回调之前。
- 第二个 Observer 监视了两个事件： BeforeWaiting(准备进入休眠) 时调用_objc_autoreleasePoolPop() 和 _objc_autoreleasePoolPush() 释放旧的池并创建新池；Exit(即将退出Loop) 时调用 _objc_autoreleasePoolPop() 来释放自动释放池。这个 Observer 的 order 是 2147483647，优先级最低，保证其释放池子发生在其他所有回调之后。
- 在主线程执行的代码，通常是写在诸如事件回调、Timer回调内的。这些回调会被 RunLoop 创建好的 AutoreleasePool 环绕着，所以不会出现内存泄漏，开发者也不必显示创建 Pool 了。


作者：jackyshan_链接：https://juejin.im/post/5b052282f265da0b7156a2aa来源：掘金著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



### 对象的释放时间

```
// General Information
// We take advantage of the documented Deallocation Timeline (WWDC 2011, Session 322, 36:22).
// 1. -release to zero
//     * Object is now deallocating and will die.
//     * New __weak references are not allowed, and will get nil.
//     * [self dealloc] is called
// 2. Subclass -dealloc
//     * bottom-most subclass -dealloc is called
//     * Non-ARC code manually releases iVars
//     * Walk the super-class chain calling -dealloc
// 3. NSObject -dealloc
//     * Simply calls the ObjC runtime object_dispose()
// 4. object_dispose()
//     * Call destructors for C++ iVars
//     * Call -release for ARC iVars
//     * Erase associated references
//     * Erase __weak references
//     * Call free()
```



> https://juejin.im/post/5b052282f265da0b7156a2aa