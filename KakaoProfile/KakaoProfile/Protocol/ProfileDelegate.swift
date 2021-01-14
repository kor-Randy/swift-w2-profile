//
//  ProfileProtocol.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/13.
//

import UIKit

protocol ProfileDelegate: class {
    func editProfile(image: UIImage?, name: String, description: String)
}
