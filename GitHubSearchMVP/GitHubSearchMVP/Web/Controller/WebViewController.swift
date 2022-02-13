//
//  WebViewController.swift
//  GitHubSearchMVP
//
//  Created by 木元健太郎 on 2022/02/13.
//

import UIKit
import WebKit


final class WebViewController: UIViewController {

  private var presenter: WebPresenterInput!

  @IBOutlet private weak var webView: WKWebView!

  func inject(presenter: WebPresenterInput) {
    self.presenter = presenter
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    //画面の読み込みが終わったことをpresenterへ伝える
    //このあと何をするかはVCは知らなくていい
    presenter.viewDidLoaded()
  }
}

extension WebViewController: WebPresenterOutput {
  //presenterからloadをしろ通知が来た時の処理
  //何があった時にこの通知がきたかVCは知らなくていい
  func load(request: URLRequest) {
    self.webView.load(request)
  }
}
