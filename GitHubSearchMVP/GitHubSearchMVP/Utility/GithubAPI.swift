//
//  GithubAPI.swift
//  GitHubSearchMVP
//
//  Created by 木元健太郎 on 2022/02/13.
//

import Foundation

enum GithubError: Error {
  case error
}

// モジュール同士を疎結合にするためprotocolを用意する
protocol GithubAPIProtocol {
  func get(searchWord: String, completion: ((Result<[GithubModel], GithubError>) -> Void)?)
}

final class GithubAPI: GithubAPIProtocol {
  static let shared = GithubAPI()

  private init() {}

  func get(searchWord: String, completion: ((Result<[GithubModel], GithubError>) -> Void)? = nil) {
    guard searchWord.count > 0 else {
      completion?(.failure(.error))
      return
    }
    let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&sort=stars")!
    let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
      guard let data = data,
            let githubResponse = try? JSONDecoder().decode(GithubResponse.self, from: data),
            let models = githubResponse.items else {
        completion?(.failure(.error))
        return
      }
      completion?(.success(models))
    })
    task.resume()
  }
}
