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
        let vc2 = VC2()
        
        let icon1 = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        let icon2 = UITabBarItem(title: "VC2", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        
        profileVC.tabBarItem = icon1
        vc2.tabBarItem = icon2
        let vcArr = [profileVC, vc2]
        self.setViewControllers(vcArr, animated: true)
    }
        
}
