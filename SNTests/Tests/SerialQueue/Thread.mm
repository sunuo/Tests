//
//  main.cpp
//  XCODE
//
//  Created by 刘俊 on 2016/11/15.
//  Copyright © 2016年 刘俊. All rights reserved.
//


#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#import "Thread.h"



class Thread
{
public:
    Thread() : done_(false) {
        pthread_mutex_init (&lock_, nullptr);
    }
    
    // 启动线程
    void start()
    {
        pthread_create(&thread_id_, nullptr, proc_func, this);
    }
    
    // 关闭线程
    void stop()
    {
        {
            Lock sync(lock_);
            done_ = true;
        }
        
        pthread_join(thread_id_, nullptr);
    }
    
private:
    
    class Lock
    {
    public:
        Lock(pthread_mutex_t lock) : lock_(lock)
        {
            pthread_mutex_lock(&lock_);
        }
        ~Lock()
        {
            pthread_mutex_unlock(&lock_);
        }
    private:
        pthread_mutex_t lock_;
    };
    
    // 线程函数，打印当前线程ID（POSIX thread id）
    static void* proc_func(void* ctx)
    {
        Thread* thread = static_cast<Thread*>(ctx);
        if (!thread) return nullptr;
        
        while (!thread->isDone()) {
            sleep(1);
            printf("thread ID: %lu\n", (unsigned long int)(void*)pthread_self());
        }
        
        return nullptr;
    }
    
    bool isDone() const {
        Lock sync(lock_);
        return done_;
    }
    
private:
    pthread_t               thread_id_;
    bool                    done_;
    mutable pthread_mutex_t lock_;
};



@implementation ThreadWrapper
{
    Thread*  thread_;
}

-(void)start
{
    thread_->start();
}

-(void)stop
{
    thread_->stop();
}

-(id)init
{
    thread_ = new Thread();
    
    if(self = [super init])
    {
        
    }
    return self;
}

-(void)dealloc
{
    if (thread_) {
        delete thread_;
    }
    [super dealloc];
}
@end

//
//int main()
//{
//    ThreadWrapper* t = [[ThreadWrapper alloc] init];
//    
//    [t start];
//    
//    
//    getchar();
//    
//    [t stop];
//    
//    [t release];
//
//    return 0;
//    
//}