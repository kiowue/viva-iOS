//
//  FirstViewController.swift
//  Viva1
//
//  Created by vishwender on 11/10/17.
//  Copyright © 2017 viva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    enum Test: String {
        case a, b, c
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let t = Test(rawValue: "b")
        if t == Test.c {
            print("success")
        } else {
            print("fail")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let storyboard = UIStoryboard(name: "Collection", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

