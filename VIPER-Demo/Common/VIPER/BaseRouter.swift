//
//  BaseRouter.swift
//  VIPER-Demo
//
//  Created by Ramy Nasser on 9/27/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import UIKit
import SafariServices
protocol RouteInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)

    func showErrorAlert(with message: String?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
}
class BaseRoute {

    fileprivate unowned var _viewController: UIViewController

    //to retain view controller reference upon first access
    fileprivate var _temporaryStoredViewController: UIViewController?

    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}
extension BaseRoute: RouteInterface {
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }

    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: "Something went wrong", message: message, actions: [okAction])
    }

    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }

    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
extension BaseRoute {
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}
extension UIViewController {

    func presentRoute(_ route: BaseRoute, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(route.viewController, animated: animated, completion: completion)
    }

}
extension UINavigationController {

    func pushRoute(_ route: BaseRoute, animated: Bool = true) {
        self.pushViewController(route.viewController, animated: animated)
    }

    func setRootWireframe(_ route: BaseRoute, animated: Bool = true) {
        self.setViewControllers([route.viewController], animated: animated)
    }

}
