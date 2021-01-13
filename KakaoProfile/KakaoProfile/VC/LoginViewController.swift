//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import UIKit

class LoginViewController: UIViewController {
    enum ValidateType {
        case lack
        case equal
        case notEqual
        case create
    }
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let userDefault = UserDefault.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
  
    private func validateAccount() -> ValidateType {
        guard let id = self.idTextField.text, let password = self.passwordTextField.text else { return .lack }
        
        if id == "" || password == "" {
            return .lack
        }
        
        if let account = userDefault.getAccount() {
            if id == account.0, password == account.1 {
                return .equal
            }
        } else {
            self.userDefault.createAccount(id: id, password: password)
            return .create
        }
        
        return .notEqual
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        switch self.validateAccount() {
            case .lack:
                self.showToast(vc: self, msg: "아이디와 비밀번호를 입력해주세요.", sec: 1.0)
                
            case .notEqual:
                self.showToast(vc: self, msg: "아이디와 비밀번호를 확인해주세요.", sec: 1.0)
                
            case .create:
                self.showToast(vc: self, msg: "기입한 정보로 회원가입되었습니다. 다시 로그인해주세요.", sec: 1.0)
            
            case .equal:
                guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
                self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
}
