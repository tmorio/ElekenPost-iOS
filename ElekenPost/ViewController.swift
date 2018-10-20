//
//  ViewController.swift
//  ElekenPost
//
//  Created by T.Morio on 2018/10/02.
//  Copyright © 2018年 T.Morio All rights reserved.
//
import UIKit
import KRProgressHUD
import KRActivityIndicatorView

class ViewController: UIViewController {
    
    @IBOutlet weak var GetButton: UIButton!
    @IBOutlet weak var ReturnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetButton.isExclusiveTouch = true
        ReturnButton.isExclusiveTouch = true
    }

    @IBAction func PostGetKey(_ sender: Any) {
        GetButton.isEnabled = false
        KRProgressHUD.show(withMessage: "通信中")
        
        let url = URL(string: "https://slack.com/api/chat.postMessage")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "token=xoxp-xxxxxxxxxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxx&channel=xxxxxxxxxx&username=ElekenPost+-+Debug&text=%E9%8D%B5%E5%80%9F%E3%82%8A%E3%81%9F".data(using: .utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "")
                KRProgressHUD.showSuccess(withMessage: "送信しました")
                sleep(2)
                KRProgressHUD.dismiss()
            } else {
                KRProgressHUD.showError(withMessage: "正常に処理できませんでした")
                sleep(2)
                KRProgressHUD.dismiss()
            }
        }.resume()
        sleep(1)
        self.GetButton.isEnabled = true
    }
    @IBAction func PostReturnKey(_ sender: Any) {
        ReturnButton.isEnabled = false
        KRProgressHUD.show(withMessage: "通信中")
        let url = URL(string: "https://slack.com/api/chat.postMessage")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "token=xoxp-xxxxxxxxxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxx&channel=xxxxxxxxxx&username=ElekenPost+-+Debug&text=%E9%8D%B5%E8%BF%94%E3%81%97%E3%81%9F".data(using: .utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "")
                KRProgressHUD.showSuccess(withMessage: "送信しました")
                sleep(2)
                KRProgressHUD.dismiss()
            } else {
                KRProgressHUD.showError(withMessage: "正常に処理できませんでした")
                sleep(2)
                KRProgressHUD.dismiss()
            }
        }.resume()
        sleep(1)
        self.ReturnButton.isEnabled = true
        
    }
    

    
}
