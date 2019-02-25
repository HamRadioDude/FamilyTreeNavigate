//
//  SeanViewController.swift
//  FamilyTreeNavigate
//
//  Created by student on 2/24/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit


class SeanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func seanButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Me!", message: "This is Sean Klechak, The Youngest!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}
