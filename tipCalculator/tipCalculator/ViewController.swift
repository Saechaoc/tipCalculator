//
//  ViewController.swift
//  tipCalculator
//
//  Created by Chris on 1/6/17.
//  Copyright © 2017 Chris Saechao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var splitNum: UILabel!
    @IBOutlet weak var tipSlider: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipText: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var splitTotal: UILabel!
    
    //When the user slides
    @IBAction func usedSlider(_ sender: UISlider) {
        let rounded = round(100 * sender.value) / 100
        let final = Int(rounded * 100)
        tipLabel.text = "\(final)"
        changeValue()
    }
    
    @IBAction func pplSlider(_ sender: UISlider) {
        let people = Int(sender.value)
        splitNum.text = "\(people)"
        changeValue()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        changeValue()
    }
    
    func changeValue() {
        let bill = Double(billField.text!) ?? 0
        let tipNum = Double(tipLabel.text!)!
        
        let tip = (tipNum/100) * bill;
        let totalBill = tip + bill;
        
        
        tipText.text = String(format: "$%.2f", tip)
        total.text = String(format: "$%.2f", totalBill)
        splitTotal.text = String(format: "$%.2f",totalBill/Double(splitNum.text!)!)
    }
    
}

