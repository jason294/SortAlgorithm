//
//  BubbleSort.swift
//  排序算法 - 冒泡排序
//
//  Created by Jason-VM-Mac on 2020/3/29.
//  Copyright © 2020 JASON. All rights reserved.
//

import Foundation

/**
 两个优化点
 - 当一轮未发生交换，说明列表已经有些，提前终止程序
 - 当尾端部分子列表已有序，缩减外层循环轮数
 */

func bubbleSort(array: inout [Int]) {
    var lastChangeIndex = array.count-1
    while lastChangeIndex > 0 {
        var isSorted = true
        for j in 0..<lastChangeIndex where exchange(array: &array, index1: j, index2: j+1, compare: >) {
            isSorted = false
            lastChangeIndex = j
        }
        if isSorted { break }
    }
}

/// 鸡尾酒排序
func cocktailSort(array: inout [Int]) {
    var leftBound = 0
    var rightBound = array.count - 1
    while leftBound < rightBound {
        var isSorted = true
        for j in leftBound..<rightBound where exchange(array: &array, index1: j, index2: j+1, compare: >) {
            isSorted = false
            rightBound = j
        }
        if isSorted { break }
        if leftBound >= rightBound { break }
        
        isSorted = true
        for j in stride(from: rightBound, to: leftBound, by: -1) where exchange(array: &array, index1: j, index2: j-1, compare: <) {
            isSorted = false
            leftBound = j
        }
        if isSorted { break }
    }
}

func exchange(array: inout [Int], index1: Int, index2: Int, compare: ((_ num1: Int, _ num2: Int) -> Bool)) -> Bool {
    if compare(array[index1], array[index2]) {
        array[index1] = array[index1] + array[index2]
        array[index2] = array[index1] - array[index2]
        array[index1] = array[index1] - array[index2]
        return true
    }
    return false
}
