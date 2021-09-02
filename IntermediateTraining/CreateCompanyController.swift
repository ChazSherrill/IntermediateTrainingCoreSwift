//
//  CreateCompanyController.swift
//  IntermediateTraining
//
//  Created by Chaz Sherrill on 9/2/21.
//  Copyright © 2021 Lets Build That App. All rights reserved.
//

import UIKit

class CreateCompanyController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Creat Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        view.backgroundColor = UIColor.darkBlue
        
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
