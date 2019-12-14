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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = UserDefaults.standard.string(forKey: "Name")
        ageTextField2.text = String(UserDefaults.standard.integer(forKey: "Age"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        var i = 0
        var str = ""
        
        if members.count == 0 {
            informationLabel.text = "no member from select feature"
            return
        }
        for member in members{
            i += 1
            str += i.description + ". "
            str += "name: " + member.name + "      " + "age: "
            str += member.age?.description ?? ""
            str += "\r"
            
        }
        informationLabel.text = str
        
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        //name에 뭔가가 들어오지 않았다면 리턴 하는거
        guard let name = nameTextField.text else { return }
        guard let age = Int(ageTextField2.text ?? "0") else { return }
        
        //informationLabel.text = (informationLabel.text ?? "")+"create button tapped\r"
        
        //객체 생성하는 법
        let member: Member = Member(name: name, age: age)
        print(member.name)
        print(member.age ?? 0)
        members.append(member)
        
        //informationLabel.text = member.name + " is added"
        //informationLabel.text = member.description(parameter: classForCoder.description())
        member.description(com: {print(#function)})
        
        hideKeyboard()
        
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.clearInfo()
        }
        UserDefaults.standard.set(name, forKey: "Name")
        UserDefaults.standard.set(age, forKey: "Age")
        UserDefaults.standard.synchronize()
        
        
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        print("Gil delete")
        
        let alertController = UIAlertController(title: "Remove Member", message: "really?", preferredStyle: .alert)
        let removeConfirm = UIAlertAction(title: "delete", style: .destructive, handler: { _ in
            self.informationLabel.text = "deleted"
            
            if self.members.count != 0{
                self.informationLabel.text = (self.informationLabel.text ?? "")+"delete button tapped\r"
                self.informationLabel.text = self.members[self.members.count-1].name + " is deleted"
                self.members.remove(at: self.members.count-1)
            }else{
                
                self.informationLabel.text = "no member from delete feature"
                return
            }
        })
        let cancelIt = UIAlertAction(title: "cancel", style: .cancel, handler: { (action)->Void in
            print("cancel")
        })
        alertController.addAction(removeConfirm)
        alertController.addAction(cancelIt)
        self.present(alertController, animated: true, completion: nil)
        //        if members.count != 0{
        //            informationLabel.text = (informationLabel.text ?? "")+"delete button tapped\r"
        //            informationLabel.text = members[members.count-1].name + " is deleted"
        //            members.remove(at: members.count-1)
        //        }else{
        //
        //            informationLabel.text = "no member from delete feature"
        //            return
        //        }
        
        
    }
    
    //마지막으로 현재 있는 값을 저장하는 기능
    @IBAction func saveToDefaults(_ sender: UIButton) {
        //UserDefaults.standard.set(members, forKey: "members")
        var memberName: [String] = []
        var memberAge: [Int] = []
        
        for i in 0..<members.count{
            memberName.append(members[i].name)
            memberAge.append(members[i].age ?? 0)
            
        }
        UserDefaults.standard.set(memberName, forKey: "Members.Name")
        UserDefaults.standard.set(memberAge, forKey: "Members.Age")
        UserDefaults.standard.synchronize()
        
    }
    
    //저장했던 값을 members에 다시 load하는 기능
    @IBAction func loadDefaultValue(_ sender: Any) {
        let names = UserDefaults.standard.array(forKey: "Members.Name") as? [String] ?? []
        let ages = UserDefaults.standard.array(forKey: "Members.Age") as? [Int] ?? []
        members = []
        for i in 0..<names.count{
            let member = Member(name: names[i], age: ages[i])
            members.append(member)
        }
        //members = UserDefaults.standard.array(forKey: "members") as! [Member]
        
    }
    
    func hideKeyboard(){
        nameTextField.resignFirstResponder()
        ageTextField2.resignFirstResponder()
    }
    
    @objc func clearInfo(){
        informationLabel.text = "";
    }
    
}

class Member {
    var name: String
    var age: Int?
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    //    func description (parameter: String)-> String {
    //        print(parameter)
    //        return "\(name),\(age ?? 0)"
    //    }
    
    func description (com: ()->Void)->String{
        com()
        return "\(name), \(age)"
    }
}
