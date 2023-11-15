//
//  AnySortAlgorithm.swift
//  AlgInterview
//
//  Created by Ash Censo on 15.11.2023.
//

import Foundation

protocol AnySortAlgorithm {
    associatedtype CompareType where CompareType: Comparable
    func nextStep() -> [CompareType]
    func previousStep() -> [CompareType]
}
