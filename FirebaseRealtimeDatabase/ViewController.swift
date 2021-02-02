//
//  ViewController.swift
//  FirebaseRealtimeDatabase
//
//  Created by Miguel Mexicano Herrera on 01/02/21.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var conditionLabel: UILabel!
    //let rootRef = Database.database().reference()
    let conditionRef = Database.database().reference().child("condition")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        conditionRef.observe(.value) { [self] (snapshot) in
            conditionLabel.text = snapshot.value.debugDescription
        }
    }
    @IBAction func foggyDidTouch(_ sender: Any) {
        conditionRef.setValue("Foggy")
    }
    @IBAction func sunnyDidTouch(_ sender: Any) {
        conditionRef.setValue("Sunny")
    }
}

