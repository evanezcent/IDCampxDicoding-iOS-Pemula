//
//  ViewController.swift
//  DicodingSegue
//
//  Created by Pratama Yoga on 01/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func moveScene(_ sender: Any) {
        performSegue(withIdentifier: "moveYellow", sender: sender)
    }
}

