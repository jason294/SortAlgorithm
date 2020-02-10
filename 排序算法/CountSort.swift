//
//  CountSort.swift
//  排序算法 - 计数排序
//
//  Created by Jason-VM-Mac on 2020/2/3.
//  Copyright © 2020 JASON. All rights reserved.
//

/**
 计数排序局限性：
 1. 不适合数组最大和最小值差距过大的情况
 2. 不适合数组元素存在非整数的情况
 
 */

import Foundation

func countSort(arr: [Int]) -> [Int] {
    // 1.获取宿主元素最大值
    let max = arr.max() ?? arr[0]
    let min = arr.min() ?? arr[0]
//    var max = arr[0]
//    var min = max
//    for item in arr {
//        if item > max {
//            max = item
//        }
//        if item < min {
//            min = item
//        }
//    }
    
    // 2.创建统计数组并统计对应元素个数
    var countArray = Array(repeating: 0, count: max-min+1)
    for item in arr {
        countArray[item-min] += 1
    }
    
    // 3.统计数组变形，后面元素等于前面的元素之和
    for i in 1...countArray.count-1 {
        countArray[i] += countArray[i-1]
    }
    
    // 4.倒序遍历原始数列，从统计数组找到正确的位置，输出到结果数组
    var sortedArray = Array(repeating: 0, count: arr.count)
    for i in stride(from: arr.count-1, through: 0, by: -1) {
        sortedArray[countArray[arr[i]-min]-1] = arr[i]
        countArray[arr[i] - min] -= 1
    }
    return sortedArray
}
