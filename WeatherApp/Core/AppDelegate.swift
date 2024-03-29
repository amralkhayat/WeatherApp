//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        mainScreenView()
        registerLocalNotifications()
        return true
    }


    private func mainScreenView(){
        window = UIWindow()
        let mainScreenViewController = WeatherList()
        let rootView = UINavigationController(rootViewController: mainScreenViewController )
        rootView.navigationBar.barTintColor = .darkText
        rootView.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        rootView.navigationBar.tintColor = .white
        window?.rootViewController =  rootView
        window?.makeKeyAndVisible()
    }
    
    //MARK:- Register  for local notifcations
    private func registerLocalNotifications(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.badge,.sound]) { granted, Error in
            if (granted  ==  false)  {
                DispatchQueue.main.async { [weak self ] in
                    self?.window?.rootViewController?.presentAlert(withTitle: "Error",
                                                                  message: "To be able to receive weather notifications you should enable notifications from setting.",
                                                                  actions: ["Ok" : UIAlertAction.Style.default])
                }
               
            }
        }
    }

}

