//
//  ViewController.swift
//  DicodingApps
//
//  Created by Pratama Yoga on 30/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func editProfile(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "Apakah Anda berniat untuk mengubah profil?",
            message: "Anda dapat memperbarui profil Anda sekarang juga.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default){_ in
            print("Changing Profile . . .")
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                print("Cancel editing . . .")
        })
        
        self.present(alert, animated: true)
    }
    
}

