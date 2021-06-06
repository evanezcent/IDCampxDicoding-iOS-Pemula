//
//  TabBarController.swift
//  DicodingDeclarativeUI
//
//  Created by Pratama Yoga on 06/06/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstView = ViewController()
        let secondView = DetailViewController()
        
        
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        secondView.tabBarItem = UITabBarItem(title: "Another", image: .actions, tag: 1)
        
        // add view and the controllers to tabbar
        viewControllers = [firstView, secondView]
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
