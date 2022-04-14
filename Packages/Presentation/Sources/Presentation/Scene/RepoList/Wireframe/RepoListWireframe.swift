//
//  RepoListWireframe.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/04/03.
//

import AppCore
import UIKit

protocol RepoListWireframe: AnyObject {
    var environment: AppEnvironment { get }
    func configure(viewController: UIViewController?)
    func presentRepoList()
}

final class RepoListWireframeImpl: RepoListWireframe {

    private weak var viewController: UIViewController?
    let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
    }

    func configure(viewController: UIViewController?) {
        self.viewController = viewController
    }

    func presentRepoList() {
        let vc = RepoListViewBuilder.build(environment: environment)
        viewController?.present(vc, animated: true)
    }
}
