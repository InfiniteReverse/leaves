# Swift中返回Self

OC：

```objective-c
+ (instancetype)instanceFromStoryboardWithName:(NSString *)name sid:(NSString *)sid
{
    id vc = ...;
    return vc;
}
```



Swift中替换 instancetype 的方式：

```swift
extension UIViewController
{
    class func instantiateFromStoryboard(storyboardName: String, storyboardId: String) -> Self
    {
        return instantiateFromStoryboardHelper(storyboardName: storyboardName, storyboardId: storyboardId)
    }

    private class func instantiateFromStoryboardHelper<T>(storyboardName: String, storyboardId: String) -> T
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }
}
```

或者：

```swift
class func instantiateFromStoryboard(storyboardName: String, storyboardId: String) -> Self
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return unsafeDowncast(controller, to: Self)
    }
```

