//
//  UserProfileView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import SwiftUI

struct UserProfileView: View {
    private let userController = UserController()
    
    var body: some View {
        Button {
            createUser(name: "ken.sasaki", gender: "男", birthday: "1996年2月22日")
        } label: {
            Text("登録")
        }
    }
}

extension UserProfileView {
    private func createUser(name: String, gender: String, birthday: String) {
        userController.createUser(name: name, gender: gender, birthday: birthday)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
