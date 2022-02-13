//
//  MVPTableViewCell.swift
//  GitHubSearchMVP
//
//  Created by 木元健太郎 on 2022/02/13.
//

import UIKit


final class MVPTableViewCell: UITableViewCell {

  static var className: String { String(describing: MVPTableViewCell.self) }

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var urlLabel: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    urlLabel.text = nil
  }

  func configure(githubModel: GithubModel) {
    self.titleLabel.text = githubModel.fullName
    self.urlLabel.text = githubModel.urlStr
  }
}
