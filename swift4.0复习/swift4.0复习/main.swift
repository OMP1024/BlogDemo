//
//  main.swift
//  swift4.0复习
//
//  Created by abbott on 07/08/2017.
//  Copyright © 2017 NIP. All rights reserved.
//

import Foundation

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

print(quotation)

let catCharaters : [Character] = ["C","a","D","W"];

for c in catCharaters {
    print(c)
}

print(String(catCharaters))

func abc(a: Int, b: Int) -> Int {
    return a + b
}

abc(a: 1, b: 2)

func cbd(_ a: Int, _ b: Int) -> Int {
    return a + b
}

cbd(10, 30)


