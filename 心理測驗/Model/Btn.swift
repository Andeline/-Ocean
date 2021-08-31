//
//  Score.swift
//  心理測驗
//
//  Created by 蔡佳穎 on 2021/8/28.
//

import Foundation

enum Btn: Int {
    case one
    case two
    case three
    case four
    case five
    
    var btnScore: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        }
    }
}


