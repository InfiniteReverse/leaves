# TaggedPointer

## 1.背景

对于64位系统，为了节省内存和提高执行效率，苹果提出了Tagged Pointer的概念。

## 2.特点

- 苹果的64位Objective-C实现中，若对象指针的最低有效位为奇数，则该指针为Tagged Pointer。
- Tagged Pointer专门用来存储小的对象，例如NSNumber/NSDate和NSString。
- Tagged Pointer指针的值不是地址，包含真正的值和对象类型信息。所以，实际上它不是一个对象，而是一个披着对象皮的普通变量。它的内存并不存储在堆中，也不需要malloc和free。
- Tagged Pointer因为并不是真正的对象，没有isa 指针。
- 内存读取和对象创建效率高。

## 3.说明

```objective-c
    NSNumber *number = @25; //number地址：0xb000000000000192，解释:b:NSNumber类型，25的16进制是19，2：整型
    NSString *a = @"a"; // a的地址：0x10be1f340
    NSString *b = [a mutableCopy]; // b的地址：0x6080002542b0
    NSString *c = [b copy]; // c的地址：0xa000000000000611 为Tagged Pointer。"a"的ASCII码值为61（十六进制）
```

- NSNumber类型：最高4位的“b”表示是NSNumber类型，最低4位(Int为2，long为3，float为4，double为5）表示基本数据类型，其余56位则用来存储数值本身内容。存储用的数值超过56位存储上限的时候，那么NSNumber才会用真正的64位内存地址存储数值，然后用指针指向该内存地址。
- NSString类型：最高位表示类型，最低位表示字符串长度。而其余的56位也是用来存储数据内容。
- NSString类型：当字符串内存长度超过了56位的时候，Tagged Pointer并没有立即用指针转向，而是用了一种算法编码，把字符串长度进行压缩存储，当这个算法压缩的数据长度超过56位了才使用指针指向。
- NSString类型：当String的内容有中文或者特殊字符（非 ASCII 字符）时，那么就只能存储为String指针。
- NSString类型：字面型字符串常量却从不存储为Tagged Pointer，因为字符串常量必须在不同的操作系统版本下保持二进制兼容，而Tagged Pointer在运行时总是由Apple的代码生成。

> https://segmentfault.com/a/1190000014635975