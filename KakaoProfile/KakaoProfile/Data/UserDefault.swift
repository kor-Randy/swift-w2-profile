//
//  UserDefault.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation

struct UserDefault{
    
    static let shared = UserDefault()
    let sp = UserDefaults.standard
    
    func createAccount(id: String, pw: String){
        sp.setValue(id, forKey: "id")
        sp.setValue(pw, forKey: "pw")
    }
    
    func getAccount() -> (id: String, pw: String)?{
        if let id = sp.string(forKey: "id"), let pw = sp.string(forKey: "pw"){
            return (id, pw)
        }else{
            return nil
        }
    }
    
}
