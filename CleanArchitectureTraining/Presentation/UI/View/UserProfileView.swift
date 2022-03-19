//
//  UserProfileView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var userProfileVM: UserProfileViewModel
    @State private var name = ""
    @State private var genderSelection = 0
    @State private var fetchButtonEnabled = false
    @State private var deleteButtonEnabled = false
    let userProfileController: UserProfileController
    private let genders = ["未選択", "男", "女", "選ばない"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("プロフィール登録")
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
                .padding(.bottom, 30)
                VStack {
                    ButtonView(text: "登録", color: .purple) {
                        createUser(name: name, gender: genderSelection)
                    }
                    .alert("登録失敗", isPresented: $userProfileVM.isShowUserNameAlert) {
                        Button("OK") {
                            name = ""
                        }
                    } message: {
                        Text("2文字以上10文字以下で登録してください")
                    }
                    .alert("登録失敗", isPresented: $userProfileVM.isShowGenderAlert) {
                        Button("OK") {}
                    } message: {
                        Text("性別を選択してください")
                    }
                    .alert("登録失敗", isPresented: $userProfileVM.isShowFailSaveUserAlert) {
                        Button("OK") {}
                    } message: {
                        Text("登録に失敗しました。通信状態が良好な環境で再度お試しください。")
                    }
                    .alert("登録完了", isPresented: $userProfileVM.isShowSuccessSaveUserAlert) {
                        Button("OK") {
                            toggleButtonEnabled()
                        }
                    } message: {
                        Text("プロフィールを登録しました")
                    }
                    ButtonView(text: "取得", color: nil) {
                        fetchUser()
                    }
                    .background(fetchButtonEnabled ? Color.green : Color.gray)
                    .cornerRadius(10)
                    .disabled(!fetchButtonEnabled)
                    .sheet(isPresented: $userProfileVM.isShowNextPage) {
                        NextPageView(
                            name: userProfileVM.userFetchOutputData.name,
                            gender: userProfileVM.userFetchOutputData.gender,
                            createdDay: userProfileVM.userFetchOutputData.createdDay
                        )
                    }
                    .alert("取得失敗", isPresented: $userProfileVM.isShowFailFetchUserAlert) {
                        Button("やり直す") {
                            
                        }
                    } message: {
                        Text("取得に失敗しました。通信状態が良好な環境で再度お試しください。")
                    }
                    ButtonView(text: "削除", color: nil) {
                        fetchUser()
                        userProfileController.deleteUser(outputData: userProfileVM.userFetchOutputData)
                    }
                    .background(deleteButtonEnabled ? Color.red : Color.gray)
                    .cornerRadius(10)
                    .disabled(!deleteButtonEnabled)
                }
                Spacer()
            }
        }
        .onAppear {
            toggleButtonEnabled()
        }
    }
}

extension UserProfileView {
    private func createUser(name: String, gender: Int) {
        userProfileController.createUser(name: name, gender: gender)
    }
    
    private func fetchUser() {
        userProfileController.fetchUser()
    }
    
    private func toggleButtonEnabled() {
        userProfileController.getIsUserDataSaved()
        fetchButtonEnabled = userProfileVM.isUserDataSaved
        deleteButtonEnabled = userProfileVM.isUserDataSaved
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileBuilder.shared.build()
    }
}
