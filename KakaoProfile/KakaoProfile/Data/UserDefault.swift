//
//  UserDefault.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation

struct UserDefault {
    static let shared = UserDefault()
    let db = UserDefaults.standard
    private let key_id = "id"
    private let key_password = "password"
    
    func createAccount(id: String, password: String) {
        db.setValue(id, forKey: key_id)
        db.setValue(password, forKey: key_password)
    }
    
    func getAccount() -> (id: String, password: String)? {
        if let id = db.string(forKey: key_id), let password = db.string(forKey: key_password) {
            return (id, password)
        } else {
            return nil
        }
    }
}
