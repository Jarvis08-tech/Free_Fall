//
//  TimerButton.swift
//  X.000.000.006
//
//  Created by Develop on 04.04.22.
//

import SwiftUI

struct TimerButton: View {
    let label: String
    let buttonColor: Color
        
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(20)
    }
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(label: "Hello", buttonColor: .red)
    }
}
