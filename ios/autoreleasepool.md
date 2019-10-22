# AutoreleasePool总结

### AutoreleasePool是什么

### AutoreleasePool原理



### Autorelease对象什么时候释放？

在没有手加Autorelease Pool的情况下，Autorelease对象是在当前的`runloop`迭代结束时释放的，而它能够释放的原因是**系统在每个runloop迭代中都加入了自动释放池Push和Pop**

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

