//
//  ContentView.swift
//  Calculator
//
//  Created by Hasan Yavuz on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    @State var currentOperation: ButtonModel.Operations = .none
    @State var runningNumber = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Text display
                
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(ButtonModel().buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            })
                        }
                    }
                }
                .padding(.bottom, 3)
            }
        }
    }
    
    func didTap(button: ButtonModel.CalculatorButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
                
            }
            
            if button != .equal {
                self.value = "0"
            }
            
        case .clear:
            self.value = "0"
            break
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item: ButtonModel.CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4 ) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
