//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation
import UIKit
import WebKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    private let url = URL(string: "https://m.daum.net")
    private lazy var request = URLRequest(url: url!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.title = "뉴스"
        self.webView.load(request)
    }
    
}
