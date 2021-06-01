//
//  ChallengesViewController.swift
//  DicodingApps
//
//  Created by Pratama Yoga on 01/06/21.
//

import UIKit

class ChallengesViewController: UIViewController {

    @IBOutlet weak var arStack: UIStackView!
    @IBOutlet weak var bookStack: UIStackView!
    @IBOutlet weak var expertStack: UIStackView!
    @IBOutlet weak var flutterStack: UIStackView!
    @IBOutlet weak var webStack: UIStackView!
    
    var challenges = [("Create Your AR Experience", "Lorem ipsum", UIImage(named: "ar")),
                          ("Digital Guest Book", "Lorem ipsum", UIImage(named: "digital")),
                          ("Expert Developer on Education Impact Applications", "Lorem ipsum", UIImage(named: "expert")),
                          ("Create Beautiful Apps Using  Flutter", "Lorem ipsum", UIImage(named: "flutter")),
                          ("Dicoding Web Master", "Lorem ipsum", UIImage(named: "web")),
                          ("Lorem ipsum dolor sit amet", "Lorem ipsum", UIImage(named: "ar"))]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tapped(parameter: &arStack)
        tapped(parameter: &bookStack)
        tapped(parameter: &webStack)
        tapped(parameter: &flutterStack)
        tapped(parameter: &expertStack)
        
    }
    
    func tapped(parameter: inout UIStackView) {
        parameter.isUserInteractionEnabled = true
        parameter.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.objectTapped)))
    }
    
    @objc func objectTapped(gesture: UIGestureRecognizer){
        guard let controller = UIStoryboard(
                        name: "Main",
                        bundle: nil
                ).instantiateViewController(
                    withIdentifier: "DetailViewScene"
                ) as? DetailViewController else { return }
        
        print("JALAN")
        
        switch gesture.view as? UIStackView {
        case(arStack):
            controller.detail = challenges[0]
        case(bookStack):
            controller.detail = challenges[1]
        case(expertStack):
            controller.detail = challenges[2]
        case(flutterStack):
            controller.detail = challenges[3]
        case(webStack):
            controller.detail = challenges[4]
        default:
            controller.detail = challenges[5]
        }
        
        self.present(controller, animated: true, completion: nil)
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
