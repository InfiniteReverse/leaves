# Swift 基本要点

> https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

1. 循环 for-in, while , repeat-while

2. 拆包 if let, guard let , 或者使用 『??』提供默认值

3. switch 不需要写break，执行完case后自行跳出

4. key-value遍历Dictionary

   ```
   for (kind, numbers) in interestingNumbers {
       for number in numbers {
           if number > largest {
               largest = number
           }
       }
   }
   ```

5. for-in循环 使用 0..<Index 使用 index

   ```
   var total = 0
   for i in 0..<4 {
       total += i
   }
   print(total)
   ```

6. ..<是闭区间 [0, 5], ...是开区间 [0, 5)

7. 使用元组返回多个值

   ```
   func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
       var min = scores[0]
       var max = scores[0]
       var sum = 0
   
       for score in scores {
           if score > max {
               max = score
           } else if score < min {
               min = score
           }
           sum += score
       }
   
       return (min, max, sum)
   }
   let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
   print(statistics.sum)
   // Prints "120"
   print(statistics.2)
   // Prints "120"
   ```

8. function可以嵌套

   ```
   func returnFifteen() -> Int {
       var y = 10
       func add() {
           y += 5
       }
       add()
       return y
   }
   ```

9. 一个函数可以将另一个函数作为其参数之一（函数是closures的一种特殊形式）。

   ```
   func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
       for item in list {
           if condition(item) {
               return true
           }
       }
       return false
   }
   func lessThanTen(number: Int) -> Bool {
       return number < 10
   }
   var numbers = [20, 19, 7, 12]
   hasAnyMatches(list: numbers, condition: lessThanTen)
   ```

10. 单条语句闭包隐式返回其唯一语句的值。

    ```
    let mappedNumbers = numbers.map({ number in 3 * number })
    ```

11. 类里面，每个属性都需要在声明处初始化或者在init方法中初始化一个值

12. 储存属性（Stored Properties）的setter里面隐含一个参数 newValue，也可以在括号中提供一个显示的名称

13. 使用willSet和didSet处理设置属性前后的事情，值得变化会在除了initializer方法外执行

14. 对于optional值，？前的如果是nil，那么后面的值将被忽略，整个表达式的值都是nil

15. 枚举内可以有与之关联的方法

    ```
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
    
        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    let ace = Rank.ace
    let aceRawValue = ace.rawValue
    ```

16. 枚举初始值为0，按顺序依次递增1，也可以显示指定。

17. 使用init?(rawValue:)可以从原始值创建枚举实例，返回与原始值匹配的枚举值，如果没有匹配则返回nil

18. 