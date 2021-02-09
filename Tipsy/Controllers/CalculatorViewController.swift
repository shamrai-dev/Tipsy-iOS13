//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billTip = BillTip(bill: 0, tip: 0, split: 1)

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0.0")
        let split = Int(splitNumberLabel.text ?? "1")
        let tip = (
            zeroPctButton.isSelected == true ? Float(0.0) :
                (tenPctButton.isSelected == true) ? Float(0.1) : Float(0.2)
        )
        billTip = BillTip(bill: bill ?? 1.0, tip: tip , split: split ?? 1)
        self.performSegue(withIdentifier: "showCalculation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCalculation" {
            let targetViewController = segue.destination as! ResultViewController
            targetViewController.total = billTip.getBillPerPerson()
            targetViewController.settings = "Split between \(billTip.split) people, with \(Int(billTip.tip * 100))% tip."
        }
    }
    
}

