//
//  Coordinator.swift
//  TechTaste
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
