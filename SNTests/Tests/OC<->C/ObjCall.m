
//
//  ObjCall.m
//  KVTestAll
//
//  Created by kevin on 15/8/30.
//
//

#import "ObjCall.h"
id target;
@implementation ObjCall
-(id)init
{
    if(self=[super init])
    {
        target=self;
    }
    return self;
}

-(void)call
{
    //在OC中通过函数调用而不是消息机制的方式调用其他 OC函数
    //这种方法规避了动态绑定
    //在一个方法需要被多次执行时，常用此种方式来提高效率
    //https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008048
    
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
    void (*func)(id sender,SEL selector);
    
    func=(void(*)(id sender,SEL selector))[self methodForSelector:@selector(showMySelf)];
    
    func(self,@selector(showMySelf));
}

-(void)showMySelf
{
    //从OC中调用C不需要做任何特殊处理
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    callMe();
}

void callMe()
{
    //在c函数中调用OC就没那么简单了，由于其不能直接调用OC的对象
    //所以需要将对象以传值的形式传递给c函数，在这里我们用的是全局变量target
    NSLog(@"%@ %@",NSStringFromClass([target class]),@"callme()");
    [target callMe];
}

-(void)callMe
{
    NSLog(@"%@ %@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}
@end
