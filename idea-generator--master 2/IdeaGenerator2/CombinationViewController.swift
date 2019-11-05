//
//  CombinationViewController.swift
//  IdeaGenerator2
//
//  Created by CCT on 5/11/19.
//  Copyright © 2019 SwiftGroup102019. All rights reserved.
//

import UIKit

class CombinationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var nextButton2: UIButton!
    @IBOutlet weak var combinationsPickerView: UIPickerView!
    
    var category: String!
    
    var combinations = [
        ["Adjective","Adverb"],
        ["Verb", "Preposition"],
        ["Noun", "Location"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextButton2.layer.cornerRadius = 12
        nextButton2.layer.shadowOffset = CGSize(width: 5, height: 10)
        nextButton2.layer.shadowOpacity = 0.2
        
      combinationsPickerView.delegate = self
    combinationsPickerView.dataSource = self
    }
    
    @IBAction func nextbutton2(_ sender: Any) {
        performSegue(withIdentifier: "selectCards", sender: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return combinations[component].count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return combinations[component][row]
       }
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return combinations.count
       }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectCards", let destination = segue.destination as? CardsViewController {
            // set destination's category
            // selectedRow(inComponent: <#T##Int#>)
            destination.category = category
            for i in 0 ..< combinations.count {
                destination.combinations[i] = combinations[i][combinationsPickerView.selectedRow(inComponent: i)]
            }
            
        }
    }


}
