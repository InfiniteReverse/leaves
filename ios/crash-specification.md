# App Crash指标

作者：刘智聪

链接：[https://www.zhihu.com/question/46919352/answer/105375897](https://www.zhihu.com/question/46919352/answer/105375897)

来源：知乎

著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

严格的讲，线上产品的崩溃率要看多指标的。 整体指标Q1 崩溃数/启动数 。 用户指标Q2 崩溃过的设备数 / 启动设备数。 去重指标Q3, 崩溃（去重\) 总数 / 启动数（去重）。这需要一些技术支持来标示"同类型"的崩溃，这个指标要求在一个设备上的同类型崩溃只计算1次崩溃和一1次启动。

为了帮助大家理解，举个实际的例子，每个设备上一段时间内应用启动后的结果可以用数字标识，0为成功，非0为崩溃退出的类型代码。那么有以下统计数据： device1:\[0,0,1,2,0,0,1\] device2:\[0,0,0,0,1,0\] device3:\[0,0,1,1,1,1,1,1,0,0,2,0\]

按上述原理计算Q1,Q2,Q3的值为 Q1=\(3+1+7\)/\(7+6+12\) = 11/25 = 44% Q2=3/3 = 100% Q3=\(2+1+2\)/\(5+6+7\) = 5/18 = 27%

用这3个基础指标来考察应用的质量可以看出更多的结论。简答的分析如下： Q1是最基础的指标，如果Q1低那么整体质量不错。 Q2用来看崩溃影响的用户，如果Q2远大于Q1,说明大部分用户都感受到了崩溃，但多重启几次就好了。 Q3可以发现是否有些用户会反复崩溃，如果Q1很高但Q3很低，说明有一部分倒霉的用户在符合某种条件后，会非常容易崩溃，即使重开应用也没办法。

真正去看这些指标还和产品的性质有关。24\*7运行的应用\(比如微信）和工具类应用，游戏类应用在分析这3个指标的时候，重点都有不同。目的都是希望透过统计数据，尽可能的了解用户对应用质量的感受。

工程上，通过对上述指标的进一步分析，也可以得出BUG修复的优先级策略。

