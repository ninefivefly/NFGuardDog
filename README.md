# NFGuardDog

[![CI Status](https://img.shields.io/travis/JIANG PENGH CHENG/NFGuardDog.svg?style=flat)](https://travis-ci.org/JIANG PENGH CHENG/NFGuardDog)
[![Version](https://img.shields.io/cocoapods/v/NFGuardDog.svg?style=flat)](https://cocoapods.org/pods/NFGuardDog)
[![License](https://img.shields.io/cocoapods/l/NFGuardDog.svg?style=flat)](https://cocoapods.org/pods/NFGuardDog)
[![Platform](https://img.shields.io/cocoapods/p/NFGuardDog.svg?style=flat)](https://cocoapods.org/pods/NFGuardDog)

APP的看门狗，基于runtime的Swizzle Method的crash防护框架，能实时捕获导致app崩溃的破坏因子并自动修复，保持应用的健壮性。

## 常见的crash

- Unrecognized Selector Sent to Instance/class
- 容器类的数组越界，key-value参数异常
- KVO crash
    - 移除了未注册的观察者，导致崩溃
    - 重复移除多次，移除次数多于添加次数，导致崩溃
    - 观察者没有实现observeValueForKeyPath:导致崩溃
    - 添加keypath为空字符串时，导致崩溃
    - 添加或者移除时 keypath == nil，导致崩溃
- KVC crash
    - key/keypath值不正确
    - 设置的值的类型不匹配
- NSString,NSMutableString,NSAttributedString,NSMutableAttributedString(下标越界以及参数nil异常)
- NSTimer（忘记invalidate ，导致内存泄漏）
- 不在主线程刷新UI
- NSNull 方法不存在
- 野指针

## 功能
- [x] Unrecognized Selector crash
- [x] Container crash 
- [x] KVO crash
- [x] KVC crash
- [x] NSString类族 Crash
- [x] NSTimer 


## 使用方法

- 开启防止Crash组件
```
    //1. 启动所有避免crash组件
    [NFGuardDog startAvoidAllCrashWithdelegate:self];
    
     //2. 启动部分避免crash组件
    NFAvoidCrashType type = NFAvoidCrashTypeKVC | NFAvoidCrashTypeKVO;
    [NFGuardDog startAvoidCrash:type delegate:self];
    
    //3. 关闭组件
    [NFGuardDog stopAvoidCrash];
    
    //4. 实现NFAvoidCrashDelegate协议
    - (void)nf_handleAvoidCrashException:(NFCrashException *)exception{
        NSLog(@"🐞🐞🐞：you have a crash need to process，see upward⬆️");
        //To do: 你可以在这儿上传捕获的异常😎😎😎
    }
```


To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

NFGuardDog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NFGuardDog'
```

## 开发计划
- ✅  AvoidCrash
- ❎  日志收集
- ❎  FPS监控
- ❎  crash收集
- ❎  流量监控

## Author

JIANG PENGH CHENG, ninefivefly@foxmail.com

## License

NFGuardDog is available under the MIT license. See the LICENSE file for more info.
