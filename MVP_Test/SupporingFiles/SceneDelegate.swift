import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        let navVC = UINavigationController(rootViewController: view)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
