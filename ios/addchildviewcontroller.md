# addChildViewController注意事项

### Container View Controller

为了方便管理视图，通常我们会选择创建一个容器视图控制器，容器视图控制器有利于在用户界面不同部分之间进行导航。UIKit中的容器视图控制器的示例包括UINavigationController，UITabBarController和UISplitViewController。

使用容器视图控制器时需要注意事项：

1. 添加子视图的时候，代码调用顺序:

```objective-c
- (void) displayContentController: (UIViewController*) content {
   [self addChildViewController:content];
   content.view.frame = [self frameForContentController];
   [self.view addSubview:self.currentClientView];
   [content didMoveToParentViewController:self];
}
```

2. 移除子视图的时候，代码调用顺序：

```objective-c
- (void) hideContentController: (UIViewController*) content {
   [content willMoveToParentViewController:nil];
   [content.view removeFromSuperview];
   [content removeFromParentViewController];
}
```

### 生命周期

当容器VC的生命周期被触发的时候，它会遍历自己的childVC来同步childVC的生命周期，可以通过断点来观察。

如果想禁用自动触发，采用手动代码的形式控制childVC的生命周，可以通过一下方法：

1. 

   ```
   - (BOOL) shouldAutomaticallyForwardAppearanceMethods {
       return NO;
   }
   ```

2. 通过调用childVC的beginAppearanceTransition:animated: 和 endAppearanceTransition这两个方法来管理

   ```
   -(void) viewWillAppear:(BOOL)animated {
       [self.child beginAppearanceTransition: YES animated: animated];
   }
    
   -(void) viewDidAppear:(BOOL)animated {
       [self.child endAppearanceTransition];
   }
    
   -(void) viewWillDisappear:(BOOL)animated {
       [self.child beginAppearanceTransition: NO animated: animated];
   }
    
   -(void) viewDidDisappear:(BOOL)animated {
       [self.child endAppearanceTransition];
   }
   ```

   

> https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html

