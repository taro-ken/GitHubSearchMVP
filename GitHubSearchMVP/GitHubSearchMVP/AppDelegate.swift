//
//  AppDelegate.swift
//  GitHubSearchMVP
//
//  Created by 木元健太郎 on 2022/02/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //起動をRouterクラスに任せる
           Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
        return true
    }
}

