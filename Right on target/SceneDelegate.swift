//
//  SceneDelegate.swift
//  Right on target
//
//  Created by Евгений Бияк on 01.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        print("willConnectTo")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 1
        // UIScreen, описывающий дисплей устройства
        // main.bounds возвращает экземпляр CGRect размеры которого соответствуют размеру дисплея.
        //window = UIWindow(frame: UIScreen.main.bounds)
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        
        // 2
        // В window обязательно должна содержаться ссылка на окно типа UIWindowScene, используемое для отображения текущего экземпляра графического интерфейса
        //window.windowScene = windowScene
        
        // 3
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MainViewController")
        
        // 4
        // Вью контроллер устанавливается в качестве корневого (стартового)
        window.rootViewController = viewController
        
        //5
        // Окно устанавливается в качестве ключевого и видимого
        // Ключевое окно – это окно, которое принимает и обрабатывает события касания, Ключевым может быть только одно окно в один момент времени.
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("sceneDidEnterBackground")
    }


}

