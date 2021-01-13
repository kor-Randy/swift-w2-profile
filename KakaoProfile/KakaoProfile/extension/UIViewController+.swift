//
//  UIViewController+.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showToast(vc: UIViewController, msg: String, sec: Double){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
            
        vc.present(alert, animated: true, completion: nil)
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + sec) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
}
