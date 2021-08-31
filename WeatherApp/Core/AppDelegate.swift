//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        mainScreenView()
        return true
    }


    private func mainScreenView(){
        window = UIWindow()
        let mainScreenViewController = WeatherList()
        let rootView = UINavigationController(rootViewController: mainScreenViewController )
        rootView.navigationBar.barTintColor = .darkGray
        rootView.navigationBar.tintColor = .white
        window?.rootViewController =  rootView
        window?.makeKeyAndVisible()
    }

}

