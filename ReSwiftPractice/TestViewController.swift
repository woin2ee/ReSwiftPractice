//
//  TestViewController.swift
//  ReSwiftPractice
//
//  Created by Jaewon Yun on 2023/09/02.
//

import ReSwift
import UIKit

final class TestViewController: UIViewController {

    lazy var loginButton: UIButton = {
        let button: UIButton = .init(configuration: .filled())
        let action: UIAction = .init { [weak self] _ in
            store.dispatch(LoginAction())
        }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
        
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
        store.subscribe(self) { subscription in
            subscription
                .select(\.authenticationState)
//                .skip(when: ==)
        }
        
    }
    
}

extension TestViewController: StoreSubscriber {
    
    func newState(state: AuthenticationState) {
        print(state.isLoggedIn)
    }
    
}
