//
//  ViewController.swift
//  HogeWorld
//
//  Created by GJS on 2019/12/07.
//  Copyright © 2019 GJS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField2: UITextField!
    
    var members:[Member] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectButtonTapped(_ sender: UIButton) {
        print("Gil select")
        var i = 0
        for member in members{
            print(i,member.name)
            print(i,member.age)
            i+=1
        }
        
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let age = Int(ageTextField2.text ?? "0") else { return }
        
        print("Gil create")
        informationLabel.text = (informationLabel.text ?? "")+"create button tapped\r"
        let member: Member = Member(name: name, age: age)
        print(member.name)
        print(member.age)
        members.append(member)
        informationLabel.text = member.name + " is added"
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        print("Gil delete")
        informationLabel.text = (informationLabel.text ?? "")+"delete button tapped\r"
        
        informationLabel.text = members[members.count-1].name + " is deleted"
        members.remove(at: members.count-1)
        

    }
    func hideKeyboard(){
        nameTextField.resignFirstResponder()
        ageTextField2.resignFirstResponder()
    }

}

class Member {
    var name: String
    var age: Int?
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
}



