//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import UIKit

class LoginViewController: UIViewController {
    enum ValidateType: Error {
        case lack
        case notExist
        case notEqual
    }
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let userDefault = UserDefault.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
  
    private func validateAccount() throws {
        guard let id = self.idTextField.text, let password = self.passwordTextField.text else { throw ValidateType.lack }
        
        if id == "" || password == "" { throw ValidateType.lack }
        
        if let account = userDefault.getAccount() {
            if id != account.0 || password != account.1 {
                throw ValidateType.notEqual
            }
        } else {
            self.userDefault.createAccount(id: id, password: password)
            
            throw ValidateType.notExist
        }
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        do {
            try self.validateAccount()
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
            self.navigationController?.pushViewController(mainVC, animated: true)
        } catch ValidateType.lack {
            self.showToast(vc: self, msg: "아이디와 비밀번호를 입력해주세요.", sec: 1.0)
        } catch ValidateType.notEqual {
            self.showToast(vc: self, msg: "아이디와 비밀번호를 확인해주세요.", sec: 1.0)
        } catch ValidateType.notExist {
            self.showToast(vc: self, msg: "기입한 정보로 회원가입되었습니다. 다시 로그인해주세요.", sec: 1.0)
        } catch {
            self.showToast(vc: self, msg: "알 수 없는 에러 발생", sec: 1.0)
        }
    }
}
