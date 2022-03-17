//
//  ButtonView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/04.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var color: Color
    var onTapButton: (() -> Void)
    
    var body: some View {
        Button {
            onTapButton()
        } label: {
            Text(text)
                .padding(.vertical, 10)
                .padding(.horizontal, 140)
                .background(color)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .cornerRadius(10)
        }
    }
}

struct RegistrationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "登録", color: .purple) {}
    }
}
