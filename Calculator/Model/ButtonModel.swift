//
//  ButtonModel.swift
//  Calculator
//
//  Created by Hasan Yavuz on 20.06.2023.
//

import Foundation
import SwiftUI

struct ButtonModel {
    
    public enum Operations {
        case add, subtract, multiply, divide, equal, none
    }
    
    public enum CalculatorButton: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
        case add = "+"
        case subtract = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
        case clear = "AC"
        case decimal = "."
        case percent = "%"
        case negative = "+/-"
        
        var  buttonColor: Color {
            switch self {
            case .add, .subtract, .multiply, .divide, .equal:
                return Color(.orange)
            case .clear, .negative, .percent:
                return Color(.lightGray)
            default:
                return Color(.darkGray)
            }
        }
    }
    
    public let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal,],
    ]
        
}
