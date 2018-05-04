//
//  ViewController.swift
//  POCApolloGraphQL
//
//  Created by Tatiana Magdalena on 02/05/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GraphQLConsumer().fetchLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

