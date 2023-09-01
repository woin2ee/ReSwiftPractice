//
//  ViewController.swift
//  ReSwiftPractice
//
//  Created by Jaewon Yun on 2023/09/01.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        self.present(TestViewController(), animated: true)
    }
    
}
