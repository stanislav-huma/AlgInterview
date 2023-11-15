//
//  BubleSortAlgorithm.swift
//  AlgInterview
//
//  Created by Ash Censo on 15.11.2023.
//

import Foundation

final class BubleSortAlgorithm<T: Comparable>: AnySortAlgorithm {
    typealias CompareType = T
    
    // MARK: - Private properties
    
    private let areInIncreasingOrder: Bool
    private var sortingState: [CompareType]
    private var steps: [SortStep] = []
    
    // MARK: - Init
    
    init(areInIncreasingOrder: Bool, initialData: [CompareType]) {
        self.areInIncreasingOrder = areInIncreasingOrder
        self.sortingState = initialData
    }
}

// MARK: - AnySortAlgorithm

extension BubleSortAlgorithm {
    func nextStep() -> [CompareType] {
        guard !sortingState.isEmpty else {
            return sortingState
        }
        
        for i in 0..<(sortingState.count - 1) {
            for j in 0..<(sortingState.count - i - 1) {
                if areInIncreasingOrder, sortingState[j + 1] < sortingState[j] {
                    steps.append(.init(firstIndex: j + i, secondIndex: j + 1 + i))
                    sortingState.swapAt(j, j + 1)
                    return sortingState
                } else if !areInIncreasingOrder, sortingState[j + 1] > sortingState[j] {
                    steps.append(.init(firstIndex: j + i, secondIndex: j + 1 + i))
                    sortingState.swapAt(j, j + 1)
                    return sortingState
                }
            }
        }
        
        return sortingState
    }
    
    func previousStep() -> [CompareType] {
        guard let last = steps.last else {
            return sortingState
        }
        
        sortingState.swapAt(last.firstIndex, last.secondIndex)
        steps.removeLast()
        
        return sortingState
    }
}

// MARK: - Nested types

private extension BubleSortAlgorithm {
    struct SortStep {
        let firstIndex: Int
        let secondIndex: Int
    }
}
