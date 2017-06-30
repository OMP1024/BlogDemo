//
//  ViewController.swift
//  RxSwfitDemo
//
//  Created by 王博 on 17/5/8.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//          create()
//          tap()
//          never()
//          just()
//          of()
//          from()
//          range()
//          repeatElement()
//          generate()
//          deferred()
//          error()
//          doOn()
//        subject()
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(ViewController1(), animated: true, completion: nil)
    }
}


extension ViewController{

    // 创建一个被观察者，和订阅者
    func create() {
       _ = Observable<String>.create { (observerOfString) -> Disposable in
            print("observer created")
            observerOfString.onNext("😷")
            observerOfString.onCompleted()
            return Disposables.create()
        }.subscribe({ (event) in
            print(event)
        })
    }
    
    // 绑定一个按钮的点击事件
    func tap() {
        _ = btn.rx.tap.asObservable().subscribe({ (_) in
            print("点击了按钮")
        })
    }
    
    // never 创建一个序列不会终止也不会发出任何事件
    func never() {
        let neverObserver = Observable<String>.never()
        neverObserver.subscribe { (_) in
            print("never")
        }.disposed(by: disposeBag)
    }
    
    // empyt 空序列，只会发出一个完成事件
    func empty() {
        let emptyObserver = Observable<Int>.empty()
        emptyObserver.subscribe { (_) in
            print("empty")
        }.disposed(by: disposeBag)
    }
    
    // just 创建一个单个元素的序列
    func just()  {
        let justObserver = Observable.just(10)
        justObserver.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    // of 使用固定数量的元素创建一个序列
    func of() {
        let ofObserver = Observable.of(10,12,14,16)
        ofObserver.subscribe(onNext: { (element) in
            print(element)
        }, onError: { (error) in
            print(error)
        }, onCompleted: { 
            print("complete")
        }) { 
            print("disposeBag")
        }.disposed(by: disposeBag)
        
        ofObserver.subscribe(onNext: { (element) in
            print(element)
        }).disposed(by: disposeBag)
    }
    
    // from 从一个序列创建一个可被观察的序列
    func from () {
        let fromObserver = Observable.from(["😀","😉","😗","🤗"])
        fromObserver.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
    }
    
    // range 创建一个发出一系列顺序`整数`然后终止的序列
    func range () {
        let rangeObserver = Observable<Int>.range(start: 1, count: 10)
        rangeObserver.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    // repeatElement 创建一个给予元素的无限序列
    func repeatElement() {
        Observable.repeatElement("🌘").takeLast(4).subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    // generate 创建一个满足指定条件的序列
    func generate() {
        Observable.generate(initialState: 10, condition: { (element) -> Bool in
            return element < 14
        }) { (element) -> Int in
            return element + 1
        }.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    // deferred 只有当订阅者订阅的时候才会去创建序列
    func deferred() {
        var count = 1
        let deferredSequence = Observable<String>.deferred { () -> Observable<String> in
            print("create \(count)")
            count += 1
            return Observable.create({ (observer) -> Disposable in
                print("emitting...")
                observer.onNext("1")
                observer.onNext("2")
                observer.onNext("3")
                return Disposables.create()
            })
        }
        
        deferredSequence.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
        
        deferredSequence.subscribe { (event) in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    enum TestError: Error {
        case test
    }
    
    // 创建一个没有元素但是以错误终止的序列
    func error() {
        Observable<Int>.error(TestError.test)
        .subscribe { (error) in
            print(error)
        }
        .disposed(by: disposeBag)
    }
    
    // 拦截器，只能拦截不能修改
    func doOn() {
        Observable.of("1","4","9")
        .do(onNext: { (element) in
            print("拦截到的值" + element)
        })
        .subscribe { (event) in
            print(event)
        }
        .disposed(by: disposeBag)
    }
    
    // Subject: 是一个桥梁，即是被观察者又是订阅者
    
    func subject() {
        let subject = PublishSubject<String>()
        subject.subscribe().disposed(by: disposeBag)
        subject.onNext("1")
        subject.onNext("2")
        
        subject.subscribe().disposed(by: disposeBag)
        subject.onNext("10")
        subject.onNext("12")
        
    }

}
