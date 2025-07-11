//
//  MainTabBarControllerViewController.swift
//  CoffeeShop
//
//  Created by Bora Özel on 20/5/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let cartViewModel = CartViewModel()
    let accountViewModel = AccountViewModel()
    let menuViewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nav = viewControllers?[0] as? UINavigationController,
           let menuVC = nav.viewControllers.first as? MenuViewController {
            menuVC.viewModel = menuViewModel
            menuVC.cartViewModel = cartViewModel
            menuVC.accountViewModel = accountViewModel
        }
        if let cartVC = viewControllers?[1] as? CartViewController {
            cartVC.viewModel = cartViewModel
        }
        if let accountVC = viewControllers?[2] as? AccountViewController {
            accountVC.viewModel = accountViewModel
        }
        
    }
    
}

