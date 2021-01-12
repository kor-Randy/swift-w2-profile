//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.title = "뉴스"
    }
}
