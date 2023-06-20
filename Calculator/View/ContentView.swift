//
//  ContentView.swift
//  Calculator
//
//  Created by Hasan Yavuz on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    
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
                            Buttons(buttonText: item.rawValue,
                                    buttonColor: item.buttonColor,
                                    width: buttonWidth(item: item),
                                    height: buttonHeight(),
                                    cornerRadius: buttonHeight() / 2)
                        }
                    }
                }
                .padding(.bottom, 3)
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
