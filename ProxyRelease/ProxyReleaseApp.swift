//
//  ProxyReleaseApp.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import SwiftUI

// https://peterfriese.dev/ultimate-guide-to-swiftui2-application-lifecycle/
// https://www.fivestars.blog/articles/app-delegate-scene-delegate-swiftui/

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
//    ) -> Bool {
//        print("This is from the delegate.")
//        return true
//    }
//}

@main
struct ProxyReleaseApp: App {

    // 1- If somehow we end up needing an AppDelegate we add this line and the AppDelegate
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @Environment(\.scenePhase) var scenePhase

    init() {
        print("Here is where we are going to init things. Equivalent to didFinishLaunchingWithOptions")
    }

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel())
                .onOpenURL { url in // Handling deep links links
                    print("Handled in ProxyReleaseApp: \(url)")
                }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("App is active")
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                break
            }
        }
    }
}
