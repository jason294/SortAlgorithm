//
//  BucketSort.swift
//  排序算法 - 桶排序
//
//  Created by Jason-VM-Mac on 2020/2/5.
//  Copyright © 2020 JASON. All rights reserved.
//

import Foundation

func bucketSort(array: [Int]) -> [Int] {
    
    // 1. 获取数组最大值和最小值  最大值加一，保证最大的元素分在最后一个桶中
    let max: Float = Float(array.max() ?? array[0]) + 1
    let min: Float = Float(array.min() ?? array[0])
    
    // 2. 初始化桶  规则：桶个数为数组元素个数
    var bucketArray: [[Int]] = Array(repeating: [], count: array.count)
    let bucketSize: Float = (max - min) / Float(array.count)
    
    // 3. 分桶
    for item in array {
        bucketArray[Int((Float(item)-min)/bucketSize)].append(item)
    }
    
    // 4. 桶内部排序
    for var item in bucketArray {
        item.sort(by: <)
    }
    
    // 5. 输出
    return bucketArray.reduce([], +)
//    var sortedArray: [Float] = []
//    for itemArray in bucketArray {
//        sortedArray.append(contentsOf: itemArray)
//    }
//    return sortedArray
}
