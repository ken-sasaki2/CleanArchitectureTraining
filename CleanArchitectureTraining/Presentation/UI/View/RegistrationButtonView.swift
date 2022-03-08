//
//  RegistrationButtonView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/04.
//

import SwiftUI

struct RegistrationButtonView: View {
    var onTapRegistrationButton: (() -> Void)
    
    var body: some View {
        Button {
            onTapRegistrationButton()
        } label: {
            Text("登録")
                .padding(.vertical, 10)
                .padding(.horizontal, 140)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .cornerRadius(10)
        }
    }
}

struct RegistrationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationButtonView {}
    }
}
