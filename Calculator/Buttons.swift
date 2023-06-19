//
//  Buttons.swift
//  Calculator
//
//  Created by Hasan Yavuz on 20.06.2023.
//

import SwiftUI

struct Buttons: View {
    var buttonText: String
    var buttonColor: Color
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonText)
                .font(.system(size: 32))
                .frame(width: width, height: height)
                .background(buttonColor)
                .foregroundColor(.white)
                .cornerRadius(cornerRadius)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(buttonText: "0",
                buttonColor: Color.orange,
                width: 90,
                height: 90,
                cornerRadius: 45
        )
    }
}
