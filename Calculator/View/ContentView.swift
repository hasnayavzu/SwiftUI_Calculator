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
    @State var runningNumber = 0.0
    @State var selectedColor: Color = .red
    @State var backgroundColor = Color(.black)

    var body: some View {
        ZStack(alignment: .top) {
            backgroundColor.edgesIgnoringSafeArea(.all)

            ColorPicker("", selection: $backgroundColor)
                .padding()

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
                currentOperation = .add
                runningNumber = Double(value) ?? 0
            } else if button == .subtract {
                currentOperation = .subtract
                runningNumber = Double(value) ?? 0
            } else if button == .multiply {
                currentOperation = .multiply
                runningNumber = Double(value) ?? 0
            } else if button == .divide {
                currentOperation = .divide
                runningNumber = Double(value) ?? 0
            } else if button == .equal {
                let runningValue = runningNumber
                let currentValue = Double(value) ?? 0
                switch currentOperation {
                case .add: value = "\(runningValue + currentValue)"
                case .subtract: value = "\(runningValue - currentValue)"
                case .multiply: value = "\(runningValue * currentValue)"
                case .divide: value = String(format: "%.2f", runningValue / currentValue)
                case .none:
                    break
                }
            }

            if button != .equal {
                value = "0"
            }

        case .clear:
            value = "0"
            break
        case .decimal, .negative, .percent:
            if button == .decimal {
                if value.contains(",") {
                    value = value
                } else {
                    value = value + ","
                }
            } else if button == .negative {
                if value.first! != "-" {
                    value = "-" + value
                } else {
                    value.remove(at: value.startIndex)
                }
            } else if button == .percent {
                value = String(Double(value)! / 100)
            }
            break
        default:
            let number = button.rawValue
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }

    func buttonWidth(item: ButtonModel.CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }

    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
