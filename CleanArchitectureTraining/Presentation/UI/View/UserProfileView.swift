//
//  UserProfileView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var userViewModel = UserViewModel()
    @State private var name = ""
    @State private var genderSelection = 0
    @State private var dateSelection = Date()
    private let userController = UserController()
    private let genders = ["未選択", "男", "女", "選ばない"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("ユーザー登録")
                    .font(.system(size: 28, weight: .semibold, design: .default))
                VStack(spacing: 0) {
                    Text("必須")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .frame(width: geometry.size.width / 1.3, alignment: .leading)
                    TextField("名前", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5)
                        .padding(.horizontal, 35)
                        .keyboardType(.default)
                }
                .padding(.top, 20)
                VStack(spacing: 0) {
                    Text("必須")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .frame(width: geometry.size.width / 1.3, alignment: .leading)
                    Picker(selection: $genderSelection, label: Text("性別")) {
                        ForEach(0..<genders.count) { index in
                            Text(genders[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: geometry.size.width / 1.2)
                }
                .padding(.top, 15)
                VStack(spacing: 0) {
                    Text("必須")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .frame(width: geometry.size.width / 1.3, alignment: .leading)
                    HStack(spacing: 0) {
                        Text("生年月日：")
                            .font(.system(size: 16, weight: .regular, design: .default))
                        DatePicker("", selection: $dateSelection, displayedComponents: .date)
                            .labelsHidden()
                    }
                    .frame(width: geometry.size.width / 1.3, alignment: .leading)
                }
                .padding(.top, 15)
                .padding(.bottom, 15)
                RegistrationButtonView {
                    createUser(name: name, gender: genderSelection, birthday: dateSelection.description)
                }
                .alert(isPresented: $userViewModel.isValidateFailure) {
                    Alert(
                        title: Text("確認"),
                        message: Text("ユーザーネームは2文字以上10文字以下でなければなりません。"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                Spacer()
            }
        }
    }
}

extension UserProfileView {
    private func createUser(name: String, gender: Int, birthday: String) {
        userController.createUser(name: name, gender: gender, birthday: birthday)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
