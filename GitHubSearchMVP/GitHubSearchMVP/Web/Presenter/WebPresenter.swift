//
//  WebPresenter.swift
//  GitHubSearchMVP
//
//  Created by 木元健太郎 on 2022/02/13.
//

import Foundation

//モジュール同士を疎結合にするためprotocolを用意する
//外から受け付けるアクションのprotocol
protocol WebPresenterInput {
  func viewDidLoaded()
}

//外へ出すアクションのprotocol
protocol WebPresenterOutput: AnyObject {
  func load(request: URLRequest)
}

final class WebPresenter {

  //外へ出すprotocolに準拠したインスタンス(ほとんどの場合ViewControllerのこと)
  private weak var output: WebPresenterOutput!
  //初期化パラメータ
  private var githubModel: GithubModel

  init(output: WebPresenterOutput, githubModel: GithubModel) {
    self.output = output
    self.githubModel = githubModel
  }
}

extension WebPresenter: WebPresenterInput {
  //外から画面に読み込まれたアクションがきたときの処理
  func viewDidLoaded() {
    guard let url = URL(string: githubModel.urlStr) else { return }
    //外へloadのアクションをしろと伝える
    self.output.load(request: URLRequest(url: url))
  }
}
