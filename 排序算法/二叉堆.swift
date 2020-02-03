//
//  二叉堆.swift
//  排序算法
//
//  Created by JASON on 2020/1/26.
//  Copyright © 2020 JASON. All rights reserved.
//

import Foundation

/// 二叉堆“上浮”调整
/// - Parameters:
///   - arr: 二叉堆
///   - isMinHeap: 是否为最小堆
func upAdjust(arr: inout [Int], isMinHeap: Bool) {
    var childIndex = arr.count - 1
    var parentIndex = (childIndex - 1) / 2
    let temp = arr[childIndex]
    
    while childIndex > 0 && ((isMinHeap && temp < arr[parentIndex]) || (!isMinHeap && temp > arr[parentIndex])) {
        arr[childIndex] = arr[parentIndex]
        childIndex = parentIndex
        parentIndex = (childIndex - 1) / 2
    }
    arr[childIndex] = temp
}

/// 二叉堆“下沉”调整
/// - Parameters:
///   - arr: 二叉堆
///   - parentIdx: 下沉的节点id
///   - isMinHeap: 是否为最小堆
///   - length: 堆的有效大小
func downAdjust(arr: inout [Int], parentIdx: Int, isMinHeap: Bool, length: Int? = nil) {
    let validLen = length ?? arr.count
    var parentIndex = parentIdx
    var childIndex = parentIndex * 2 + 1
    let temp = arr[parentIndex]
    
    while childIndex < validLen {
        let rightChildIndex = childIndex + 1
        
        if rightChildIndex < validLen && ((isMinHeap && arr[childIndex] > arr[rightChildIndex]) || (!isMinHeap && arr[childIndex] < arr[rightChildIndex])) {
            childIndex = rightChildIndex
        }
        
        if (isMinHeap && temp <= arr[childIndex]) || (!isMinHeap && temp >= arr[childIndex]) { break }
        arr[parentIndex] = arr[childIndex]
        parentIndex = childIndex
        childIndex = parentIndex * 2 + 1
    }
    arr[parentIndex] = temp
}

/// 构建二叉树
/// - Parameters:
///   - arr: 待构建的二叉树
///   - isMinHeap: 是否为最小堆
func buildHeap(arr: inout [Int], isMinHeap: Bool) {
    for i in (0...(arr.count-2)/2).reversed() {
        downAdjust(arr: &arr, parentIdx: i, isMinHeap: isMinHeap)
    }
}


/// 堆排序
/// - Parameters:
///   - arr: 待排序数组
///   - isAscending: 是否为升序
func heapSort(arr: inout [Int], isAscending: Bool) {
    
    buildHeap(arr: &arr, isMinHeap: !isAscending)
    print("\(isAscending ? "最大堆" : "最小堆")：\(arr)")
    for i in (1...(arr.count-1)).reversed() {
        arr[0] = arr[0] + arr[i]
        arr[i] = arr[0] - arr[i]
        arr[0] = arr[0] - arr[i]
        downAdjust(arr: &arr, parentIdx: 0, isMinHeap: !isAscending, length: i)
    }
}
