//
//  AppState.swift
//  ReSwiftPractice
//
//  Created by Jaewon Yun on 2023/09/01.
//

import Foundation
import ReSwift

struct AppState {
    
    var authenticationState: AuthenticationState
    
}

func appReducer(action: Action, state: AppState?) -> AppState {
    let state: AppState = .init(
        authenticationState: authenticationReducer(action: action, state: state?.authenticationState) // 현재 dispatching action 과 state 를 전달하여 새로운 상태를 얻음
    )
    return state
}
