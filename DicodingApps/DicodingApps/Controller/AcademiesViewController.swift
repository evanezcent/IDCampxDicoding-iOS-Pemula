//
//  AcademiesViewController.swift
//  DicodingApps
//
//  Created by Pratama Yoga on 01/06/21.
//

import UIKit

class AcademiesViewController: UIViewController {

    @IBOutlet weak var androidStack: UIStackView!
    @IBOutlet weak var cloudStack: UIStackView!
    @IBOutlet weak var unityStack: UIStackView!
    @IBOutlet weak var arStack: UIStackView!
    
    var academies = [("Android Developer", "Lorem ipsum", UIImage(named: "android")),
                         ("Unity Game Developer", "Lorem ipsum", UIImage(named: "unity")),
                         ("AR / VR Developer", "Lorem ipsum", UIImage(named: "arvr")),
                         ("Cloud Developer", "Lorem ipsum", UIImage(named: "cloud")),
                         ("Lorem ipsum dolor sit amet", "Lorem ipsum", UIImage(named: "android"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapped(parameter: &androidStack)
        tapped(parameter: &cloudStack)
        tapped(parameter: &unityStack)
        tapped(parameter: &arStack)
        // Do any additional setup after loading the view.
    }
    
    func tapped(parameter: inout UIStackView) {
        parameter.isUserInteractionEnabled = true
        parameter.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.objectTapped)))
        print("JALAN 1")
    }
    
    @objc func objectTapped(gesture: UIGestureRecognizer){
        guard let controller = UIStoryboard(
                        name: "Main",
                        bundle: nil
                ).instantiateViewController(
                    withIdentifier: "DetailViewScene"
                ) as? DetailViewController else { return }
        print("JALAN 2")
        switch gesture.view as? UIStackView {
        case(androidStack):
            controller.detail = academies[0]
        case(unityStack):
            controller.detail = academies[1]
        case(cloudStack):
            controller.detail = academies[2]
        case(arStack):
            controller.detail = academies[3]
        default:
            controller.detail = academies[4]
        }
        
        self.present(controller, animated: true, completion: nil)
        print("JALAN #")
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
