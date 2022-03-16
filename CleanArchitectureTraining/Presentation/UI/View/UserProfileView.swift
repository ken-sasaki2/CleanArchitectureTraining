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
                    RegistrationButtonView {
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
                            toggleFetchButtonEnabled()
                        }
                    } message: {
                        Text("プロフィールを登録しました")
                    }
                    Button {
                        fetchUser()
                    } label: {
                        Text("取得")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 140)
                            .background(fetchButtonEnabled ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .cornerRadius(10)
                    }
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
                }
                Spacer()
            }
        }
        .onAppear {
            toggleFetchButtonEnabled()
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
    
    private func toggleFetchButtonEnabled() {
        userProfileController.getIsUserDataSaved()
        fetchButtonEnabled = userProfileVM.isUserDataSaved
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileBuilder.shared.build()
    }
}
