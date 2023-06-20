//
//  ContentView.swift
//  Calculator
//
//  Created by Hasan Yavuz on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Text display
                
                HStack {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(ButtonModel().buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Buttons(buttonText: item.rawValue,
                                    buttonColor: item.buttonColor,
                                    width: buttonWidth(),
                                    height: buttonHeight(),
                                    cornerRadius: buttonWidth() / 2  )
                        }
                    }
                }
                .padding(.bottom, 3)
            }
        }
    }
    
    func buttonWidth() -> CGFloat {
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
