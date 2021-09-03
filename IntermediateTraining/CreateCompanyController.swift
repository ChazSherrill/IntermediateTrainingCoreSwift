//
//  CreateCompanyController.swift
//  IntermediateTraining
//
//  Created by Chaz Sherrill on 9/2/21.
//  Copyright © 2021 Lets Build That App. All rights reserved.
//

import UIKit
import CoreData

//Custom Delegation

protocol CreateCompanyControllerDelegate{
    func didAddCompany(company: Company)
}

class CreateCompanyController: UIViewController{
    
    //not tightly -coupled by using delegate
    var delegate: CreateCompanyControllerDelegate?
    
    //var companiesController: CompaniesController? //this links to the Companies controller (this has been replaced with the delegate line 13-15 and line 19)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        //enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        navigationItem.title = "Creat Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = UIColor.darkBlue
        }
    
    @objc private func handleSave(){
        print("Trying to save company...")
        
        //initialization of our Core Data Stack

        let persistentContainer = NSPersistentContainer(name: "IntermediateTrainingModels")
        persistentContainer.loadPersistentStores { (storeDescription, err) in
            if let err = err{
                fatalError("Loading of store failed: \(err)")
            }
        }
        
        let context = persistentContainer.viewContext
        
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        
        company.setValue(nameTextField.text, forKey: "name")
        
        //perform the save
        do{
            try context.save()
        }catch let saveErr{
            print("Failed to save company:", saveErr)
        }
  
        //        dismiss(animated: true){
//            guard let name = self.nameTextField.text else { return }
//
//            let company = Company(name: name, founded: Date())
//
//            self.delegate?.didAddCompany(company: company)
//            }
        }
    
    private func setupUI() {
        let lightBlueBackGroundView = UIView()
        lightBlueBackGroundView.backgroundColor = UIColor.lightBlue
        lightBlueBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackGroundView)
        
        lightBlueBackGroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackGroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackGroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackGroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
        
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
