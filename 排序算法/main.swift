//
//  main.swift
//  排序算法
//
//  Created by JASON on 2020/1/26.
//  Copyright © 2020 JASON. All rights reserved.
//

import Foundation

fileprivate let arr: [Int] = [2,4,14,11,12,3,4,5,6,7,8]

// 冒泡排序
var bubbleArray = arr
bubbleSort(array: &bubbleArray)
print("冒泡排序：\(bubbleArray)")

// 堆排序
var heapArr = arr
heapSort(arr: &heapArr, isAscending: true)
print(heapArr)

// 桶排序
let newArr = bucketSort(array: arr)
print(newArr)

// 计数排序
let countArray = countSort(arr: arr)
print(countArray)
