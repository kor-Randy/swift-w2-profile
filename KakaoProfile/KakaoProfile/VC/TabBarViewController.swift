//
//  TabBarViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/11.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") else { return }
        guard let loginNavigation = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigation") else { return }
        
        let icon1 = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        let icon2 = UITabBarItem(title: "로그인", image: UIImage(systemName: "lock.circle"), selectedImage: UIImage(systemName: "lock.circle"))
        
        profileVC.tabBarItem = icon1
        loginNavigation.tabBarItem = icon2
        let vcArr = [profileVC, loginNavigation]
        self.setViewControllers(vcArr, animated: true)
    }
}
