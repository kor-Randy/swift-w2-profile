//
//  TabBarViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/11.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate{
    
    let vc1 = VC1()
    let vc2 = VC2()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let icon1 = UITabBarItem(title: "VC1", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        let icon2 = UITabBarItem(title: "VC2", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        
        vc1.tabBarItem = icon1
        vc2.tabBarItem = icon2
        let vcArr = [vc1, vc2]
        self.setViewControllers(vcArr, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(tabBarController.selectedIndex)")
    }
    
}
