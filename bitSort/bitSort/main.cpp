//
//  main.cpp
//  bitSort
//
//  Created by abbott on 2017/10/26.
//  Copyright © 2017年 NIP. All rights reserved.
//

#include <iostream>
#include <bitset>

using namespace std;

const int max_elment = 12;

int main(int argc, const char * argv[]) {
    // insert code here...
    int arr[] = {1,3,8,12,6,4,9,10,0};
    bitset<max_elment + 1> bit;

    int size = sizeof(arr) / sizeof(arr[0]);

    for (int i = 0; i < size; i++) {
        bit.set(arr[i]);
    }

    cout << "sort after:\n";

    for (int i = 0; i <= max_elment; i++) {
        if (bit.test(i)) {
            cout << i << " ";
        }
    }
    return 0;
}
