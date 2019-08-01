---
description: open/public/internal/fileprivate/private作用与区别
---

# Access Control 访问控制

Swift提供了5个不同的访问级别。这些访问级别与定义实体的源文件相关，也与源文件所属的`module`相关。

以下访问级别由高到底：open，public，internal，fileprivate，private。

#### Open

访问级别最高

在模块内的任何源文件中都可以使用，也可以在模块外的任何源文件中使用。

#### Public

在模块内的任何源文件中都可以使用，也可以在模块外的任何源文件中使用。

一般在定义框架的公共接口时，才会使用以上两种级别。

#### Internal

在模块内的任何源文件中都可以使用，在模块外不能使用。

一般在定义程序内部结构时，通常使用`internal`。

#### Fileprivate

只能在为自己定义的源文件内使用。

#### Private

只能在为自己定义的作用域内，以及同一个文件中该声明的`extension`内使用。

#### Swift 默认级别

只要没有显示的指定访问级别，那么默认的级别是  `internal`

####  Open 与 Public 的区别

开放访问仅适用于类和类成员，它与公共访问的区别如下：

1. `public` 修饰的类只能在由它们定义的模块内继承
2. `public` 修饰的类成员只能在由它们定义的模块内重载
3. `open` 修饰的类可以在任意模块内继承
4. `open` 修饰的成员可以在任意模块内重载



> [https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)

