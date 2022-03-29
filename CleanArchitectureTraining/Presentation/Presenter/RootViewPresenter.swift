//
//  RootViewPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation
 
protocol RootViewPresenterInterface {
    func changeProfileView()
}

final class RootViewPresenter: RootViewPresenterInterface {
    
    func changeProfileView() {
        RootViewMode.shared.changeRootView(rootView: .profile)
    }
}
