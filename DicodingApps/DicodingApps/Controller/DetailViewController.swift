//
//  DetailViewController.swift
//  DicodingApps
//
//  Created by Pratama Yoga on 01/06/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descDetail: UILabel!
    
    var detail : (title: String?, desc: String?, image: UIImage?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(detail.title)

        titleDetail.text = detail.title
        descDetail.text = detail.desc
        imageDetail.image = detail.image
        
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
