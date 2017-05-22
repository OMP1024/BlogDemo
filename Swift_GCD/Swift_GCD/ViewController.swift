//
//  ViewController.swift
//  Swift_GCD
//
//  Created by 王博 on 17/5/10.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var queue: DispatchQueue!
    
    let workItem = DispatchWorkItem {
        for i in 0 ..< 10 {
            print("🔴",i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        gcd_test1()
        
//        gcd_test2()
        
//        gcd_test3()
        
//        gcd_test4()
        
//        gcd_after()
        
//        gcd_workItem()
        
//        workItem.perform()
        
//        gcd_group()
        
        gcd_group1()
    }
}


extension ViewController{

func gcd_test1() {
    // 创建一个队列，并给队列提供一个独一无二的标签，DNS
    let queue = DispatchQueue(label: "com.newsinpalm")

    // 队列创建完，就可以执行同步sync，异步操作async
    queue.async {
        for i in 0 ..< 10 {
            print("🔴",i)
        }
    }
    queue.async {
        for i in 100 ..< 110 {
            print("😷",i)
        }
    }
}
    
    // 队列的优先级
    func gcd_test2() {
let queue1 = DispatchQueue(label: "com.nip.queue1", qos: DispatchQoS.default)
let queue2 = DispatchQueue(label: "com.nip.queue2", qos: DispatchQoS.userInteractive)
queue1.async {
    for i in 0 ..< 10 {
        print("👨‍❤️‍👨",i)
    }
}

queue2.async {
    for i in 100..<110{
        print("👃🏻",i)
    }
}
    }
    
    // 异步并发队列，自动执行
    func gcd_test3() {
        let anotherQueue = DispatchQueue(label: "com.nip.another", qos: .default, attributes: .concurrent)
        
        anotherQueue.async {
            for i in 0 ..< 10 {
                print("🔴",i)
            }
        }
        
        anotherQueue.async {
            for i in 100..<110{
                print("🌘",i)
            }
        }
    }
    
    // 异步并发，手动执行
    func gcd_test4() {
        let anotherQueue = DispatchQueue(label: "com.nip.another", qos: .userInitiated, attributes: [.concurrent,.initiallyInactive])
        queue = anotherQueue
        anotherQueue.activate()
        
        anotherQueue.async {
            for i in 0 ..< 10 {
                print("🎾",i)
            }
        }
        
        anotherQueue.async {
            for i in 100..<110{
                print("🏐",i)
            }
        }
        anotherQueue.async {
            for i in 100..<110{
                print("🏉",i)
            }
        }
    }
    
    func gcd_after() {
        print(Date())
        
        let queue = DispatchQueue(label: "com.nip.delay", qos: .userInitiated)
        
        queue.asyncAfter(deadline: .now() + 3) { 
            print("⚽️",Date())
        }
    }
    
    func gcd_workItem() {
        let queue = DispatchQueue(label: "com.nip.queue")
        queue.async(execute: workItem)
    }
    
    func gcd_group() {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            group.leave()
            for i in 0..<10{
                print(" 🏐 ",i)
            }
        }
        
        group.enter()
        DispatchQueue.global().async { 
            for i in 100..<110{
                print(" 🏉 ",i)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { 
            for i in 1000..<1010 {
                print(" 🚀 ",i)
            }
        }
    }
    
    func gcd_group1() {
        
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) { 
            for i in 0..<10{
                print(" 🏐 ",i)
            }
        }
  
        DispatchQueue.global().async(group: group) { 
            for i in 0..<10{
                print(" 🏉 ",i)
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            for i in 0..<10{
                print("打印 🏐 🏉 完成",i)
            }
        }
    }
}

