//
//  ViewController.swift
//  HW4
//
//  Created by Daniyar Agaltsov on 7/30/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var workField: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var straightToggle: UISwitch!
   
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        
       
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        salaryLabel.text = "$\(Int(slider.value))k"
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        var message = ""
        let title = "My personal Info"
        if let name = nameField.text{
             message = "Hi, I am \(name)."
        }
      
        let birthday: Date = datePicker.date
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: birthday, to: today)
        
        let ageYears = components.year
        
        message.append(contentsOf: " As a \(ageYears ?? 0)-year-old")
        
        if let work = workField.text{
            message.append(contentsOf: " \(work) earning ")
        }
        message.append(contentsOf: "$\(Int(slider.value))k/year, I am intersted in ")
        var interest: String
        let gender = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)
        let isStraight = straightToggle.isOn
        
        if(gender=="Male"){
            if(isStraight){
               interest = "Women"
            }
            else{
                interest = "Men"
            }
            
        }
        else{
            if(isStraight){
                interest = "Men"
            }
            else{
                interest = "Women"
            }
            
        }
        message.append(contentsOf: "\(interest). Feel free to contact me!")
        
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}

