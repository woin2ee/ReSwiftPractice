//
//  AuthenticationState.swift
//  ReSwiftPractice
//
//  Created by Jaewon Yun on 2023/09/01.
//

import Foundation
import ReSwift

// 상태를 가지고 있는 객체 == {상태 객체}
struct AuthenticationState: Equatable {
    
    var isLoggedIn: Bool
    
}

fileprivate var initialAuthenticationState: AuthenticationState {
    return .init(isLoggedIn: false)
}

// {상태 객체} 에 대한 Action 들의 처리를 정의하고 {상태 객체} 를 반환하는 함수
func authenticationReducer(action: Action, state: AuthenticationState?) -> AuthenticationState {
    var state = state ?? initialAuthenticationState
    
    switch action {
    case _ as LoginAction:
        state.isLoggedIn = true
    case _ as LogoutAction:
        state.isLoggedIn = false
    default:
        break
    }
    
    return state
}

struct LoginAction: Action {}

struct LogoutAction: Action {}
