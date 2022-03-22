//
//  AuthSignUpView.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import SwiftUI

struct AuthSignUpView: View {
    @ObservedObject var authSignUpVM: AuthSignUpViewModel
    @State private var email = ""
    @State private var password = ""
    let authController: AuthController
    
    var body: some View {
        ButtonView(text: "Sign Up.", color: .black, buttonEnabled: true) {
            onTapSignUpButton(email: "nkekisasa222@gmail.com", password: "nkekisasa2")
        }
        .alert("登録完了", isPresented: $authSignUpVM.isShowSuccessSignUpAlert) {
            Button("OK") {
                //ページ遷移
            }
        } message: {
            Text("サインアップに成功しました！")
        }
        .alert("登録失敗", isPresented: $authSignUpVM.isShowFailInvalidEmailAlert) {
            Button("やり直す") {
                resetEmailAndPassword()
            }
        } message: {
            Text("メールアドレスの形式が間違っています")
        }
        .alert("登録失敗", isPresented: $authSignUpVM.isShowFailWeakPasswordAlert) {
            Button("やり直す") {
                resetEmailAndPassword()
            }
        } message: {
            Text("パスワードは6文字以上で入力して下さい")
        }
        .alert("登録失敗", isPresented: $authSignUpVM.isShowFailEmailAlreadyInUseAlert) {
            Button("やり直す") {
                resetEmailAndPassword()
            }
        } message: {
            Text("このメールアドレスは既に登録されています")
        }
        .alert("登録失敗", isPresented: $authSignUpVM.isShowFailNetworkErrorAlert) {
            Button("OK") {
                resetEmailAndPassword()
            }
        } message: {
            Text("登録に失敗しました。通信状態が良好な環境で再度お試しください")
        }
        .alert("登録失敗", isPresented: $authSignUpVM.isShowFailOtherErrorAlert) {
            Button("OK") {
                resetEmailAndPassword()
            }
        } message: {
            Text("登録に失敗しました。時間をあけて再度お試しください")
        }
    }
}

extension AuthSignUpView {
    private func resetEmailAndPassword() {
        email = ""
        password = ""
    }
    
    private func onTapSignUpButton(email: String, password: String) {
        authController.signUp(email: email, password: password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AuthSignUpBuilder.shared.build()
    }
}
