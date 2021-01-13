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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.title = "뉴스"
        setWebView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showToast(vc: self, msg: "로그인되었습니다.", sec: 1.0)
    }

    private func setWebView() {
        if let url = self.url{
            let request = URLRequest(url: url)
            self.webView.load(request)
        }else{
            showToast(vc: self, msg: "URL에 접근할 수 없습니다.", sec: 1.0)
        }
    }
}
