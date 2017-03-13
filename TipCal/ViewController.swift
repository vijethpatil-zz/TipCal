//
//  ViewController.swift
//  TipCal
//
//  Created by Patil, Vijeth on 3/6/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
  
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var tipPercentageSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red:0.07, green:0.75, blue:1.00, alpha:1.0)]
        
        self.view.backgroundColor = UIColor.black

        let defaults = UserDefaults.standard
        let defaultTipPercentageValue = defaults.value(forKey: "defaultTipLabel") as! Int
        defaultTipLabel.text = "\(defaultTipPercentageValue)%"
       // let intValue = defaults.integerForKey("defaultTipLabel")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipPercentageValue = defaults.value(forKey: "defaultTipLabel") as! Int
        defaultTipLabel.text = "\(defaultTipPercentageValue)%"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.9, delay: 0.8, options: .curveEaseIn, animations: {
            self.navigationController?.navigationBar.alpha = 1
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

 
    @IBAction func calculate(_ sender: Any) {
        calculateTip(sender)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.12,0.15,0.18,0.22]
        
        let bill = Double(billField.text!) ?? 0
        
        let defaults = UserDefaults.standard
        let defaultTip = (defaults.value(forKey: "defaultTipPercentage") ?? 0.00) as! Double
        
        // let intValue = defaults.integerForKey("defaultTipLabel")

        var tipx = defaultTip
        if(tipPercentageSegment.selectedSegmentIndex != UISegmentedControlNoSegment) {
            tipx = tipPercentage[tipPercentageSegment.selectedSegmentIndex]
        }
        
        let tip = bill * tipx
        
        
        let totalAmount = bill + tip
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",totalAmount)
        
    }
}

