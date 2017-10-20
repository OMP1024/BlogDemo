//
//  ViewController.swift
//  swift4news
//
//  Created by abbott on 2017/9/19.
//  Copyright © 2017年 NIP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let letters = ["a","b","c","d"]
        let numberedLetters = zip(1..., letters)
        let array =  Array(numberedLetters)
        print(array)

        let number = [1,2,3,4,5,6,7,8,9,10]
        print(number[5...])

        let value = 5
        switch value {
        case 1...:
            print("greater than zero")
        case 0:
            print("zero")
        case ..<0:
            print("less than zero")
        default:
            fatalError("unreachable")
        }
    }

}

