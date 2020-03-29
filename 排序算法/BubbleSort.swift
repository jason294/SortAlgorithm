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
        for j in 0..<lastChangeIndex {
            if array[j] > array[j+1] {
                array[j] = array[j] + array[j+1]
                array[j+1] = array[j] - array[j+1]
                array[j] = array[j] - array[j+1]
                isSorted = false
                lastChangeIndex = j
            }
        }
        if isSorted { break }
    }
}
