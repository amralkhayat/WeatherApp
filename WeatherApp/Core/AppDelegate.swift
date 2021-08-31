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
        rootView.navigationBar.barTintColor = .blue
        rootView.navigationBar.tintColor = .white
        rootView.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        rootView.navigationBar.prefersLargeTitles = true
        rootView.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window?.rootViewController =  rootView
        window?.makeKeyAndVisible()
    }

}

