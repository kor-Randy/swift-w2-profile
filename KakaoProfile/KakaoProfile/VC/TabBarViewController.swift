//
//  TabBarViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/11.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") else { return }
        
        let icon1 = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        
        profileVC.tabBarItem = icon1
        let vcArr = [profileVC]
        self.setViewControllers(vcArr, animated: true)
    }
        
}
