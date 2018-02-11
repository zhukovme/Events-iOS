//
//  AppDelegate.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit
import DITranquillity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)

        let container = DIContainer()
        container.append(framework: AppModule.self)

        container.registerStoryboard(name: "Main", bundle: nil)
            .lifetime(.single)

        if !container.validate() {
            fatalError("Container not valid")
        }

        window!.rootViewController = (*container as UIStoryboard).instantiateInitialViewController()
        window!.makeKeyAndVisible()
    }
}
