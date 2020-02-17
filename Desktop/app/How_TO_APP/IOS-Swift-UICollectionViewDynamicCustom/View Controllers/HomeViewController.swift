//
//  HomeViewController.swift
//  IOS-Swift-UICollectionViewDynamicCustom
//
//  Created by Igwe Onumah on 2/4/20.
//  Copyright © 2020 Igwe Onumah. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deviceAct(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard (name: "Main", bundle: Bundle.main)
        
        guard let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            print ("Couldn't fine the view controller")
            return
            }
        navigationController?.pushViewController(homeViewController, animated: true)
        }
        
    }
    
