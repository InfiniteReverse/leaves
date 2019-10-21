# Block总结



### 为什么Block要使用Copy修饰

因为需要复制一个块以跟踪其在原始范围之外的捕获状态。使用ARC时，它会自动发生，不需要管，但最好的做法是让property属性显示结果行为。



> https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html#//apple_ref/doc/uid/TP40011210-CH8-SW12