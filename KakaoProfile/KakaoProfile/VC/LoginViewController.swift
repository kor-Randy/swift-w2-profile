//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let userDefault = UserDefault.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
  
    private func checkAccount() -> Bool{
        guard let id = self.idTextField.text, let password = self.passwordTextField.text else {
            return false
        }
        
        if id == "" || password == ""{
            self.showToast(vc: self, msg: "아이디와 비밀번호를 입력해주세요.", sec: 1.0)
            return false
        }
        
        if let account = userDefault.getAccount(){
            if id == account.0 && password == account.1{
                //AlertController를 호출되고 있는 시간 동안, tappedLoginButton시 다른 VC가 호출될 수 없음
//                self.showToast(vc: self, msg: "로그인 되었습니다.", sec: 1.0)
                return true
            }else{
                self.showToast(vc: self, msg: "아이디와 비밀번호를 확인해주세요.", sec: 1.0)
            }
        }else{
            userDefault.createAccount(id: id, password: password)
            self.showToast(vc: self, msg: "기입한 정보로 회원가입되었습니다. 다시 로그인해주세요.", sec: 1.0)
        }
        
        return false
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        if checkAccount(){
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
            
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
}
