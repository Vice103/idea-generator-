//
//  CategoryViewController.swift
//  IdeaGenerator2
//
//  Created by CCT on 5/11/19.
//  Copyright © 2019 SwiftGroup102019. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var nextbutton: UIButton!
    
    var categories = ["Fantasy","Sci-Fi", "Horror", "Mystery"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextbutton.layer.cornerRadius = 12
        nextbutton.layer.shadowOffset = CGSize(width: 5, height: 10)
        nextbutton.layer.shadowOpacity = 0.2
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "selectCombination", sender: nil)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectCombination", let destination = segue.destination as? CombinationViewController {
            // set destination's category
            // selectedRow(inComponent: <#T##Int#>)
            destination.category = categories[categoryPicker.selectedRow(inComponent: 0)]
        }
    }
    

}
