//
//  ViewController1.swift
//  RxSwfitDemo
//
//  Created by 王博 on 17/5/19.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController1: UIViewController {
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        combineLatest()
    }

}


extension ViewController1 {

    // 在序列触发值之前插入一个多个元素的特殊序列
    func startWith() {
        Observable.of("1","2","3","4")
        .startWith("🌘")
        .startWith("🏉")
        .startWith("😀","😬","😁")
        .subscribe { (event) in
            print(event)
        }
        .disposed(by: disposeBag)
    }
    
    // 把多个序列合并成单个序列，并按照事件触发的先后顺序，一次发设值
    func merge() {
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()
        
        Observable.of(subject1,subject1)
        .merge()
        .subscribe { (event) in
            print(event)
        }
        .disposed(by: disposeBag)
        subject1.onNext("⌚️")
        subject1.onNext("📱")
        
        subject2.onNext("⚽️")
        subject2.onNext("🏀")
        
        subject1.onNext("🎨")
        subject2.onNext("🚗")
    }
    
    // 把多个序列组合到一起并触发一个值，但只有每个序列都发射了一个值之后才会组合成一个新的值并发出来
    func zip() {
        let stringSubject = PublishSubject<String>()
        let intSubject = PublishSubject<Int>()
        
        Observable.zip(stringSubject, intSubject) { (stringElement, intElement) -> String in
            return "\(stringElement) \(intElement)"
        }
        .subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
        stringSubject.onNext("🅰️")
        stringSubject.onNext("🅱️")
        intSubject.onNext(1)
        intSubject.onNext(2)
        stringSubject.onNext("🆎")
        intSubject.onNext(3)
    
    }
    
    // combineLatest 获取两个序列的最新值，并通过某个函数对其进行处理，处理完之后返回一个新的发设值
    func combineLatest() {
        let stringSubject = PublishSubject<String>()
        let intSubject = PublishSubject<Int>()
        Observable.combineLatest(stringSubject, intSubject) { stringElement, intElement in
            "\(stringElement) \(intElement)"
            }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        stringSubject.onNext("🅰️")
        stringSubject.onNext("🅱️")
        intSubject.onNext(1)
        intSubject.onNext(2)
        stringSubject.onNext("🆎")
    }
    
}
