//
//  DetailViewController.swift
//  DicodingDynamicTable
//
//  Created by Pratama Yoga on 06/06/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroDesc: UILabel!
    
    var hero: Hero?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = hero {
            heroName.text = result.name
            heroDesc.text = result.description
            heroImage.image = result.photo
        }
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
