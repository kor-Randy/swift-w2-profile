//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation
import UIKit
import WebKit

class MainViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    private let url = URL(string: "https://m.daum.net")
    private lazy var request = URLRequest(url: url!)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.title = "뉴스"
        self.webView.load(self.request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showToast(vc: self, msg: "로그인되었습니다.", sec: 1.0)
        
    }
}
