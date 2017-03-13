//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Patil, Vijeth on 3/13/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let defaultTip = (defaults.value(forKey: "defaultTipLabel") ?? 4.00) as! Int
        defaultTipLabel.text = "\(defaultTip)%"
        tipSlider.value = (defaults.value(forKey: "defaultTipLabel") ?? 4.00) as! Float

        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func sliderValueChanged(_ sender: Any) {
        let currentValue = Int(tipSlider.value)
        defaultTipLabel.text = "\(currentValue)%"
        
        let defaults = UserDefaults.standard
        var saveValue = tipSlider.value
        if(saveValue != 0) {
            saveValue = saveValue/100;
        }
        defaults.set(saveValue, forKey: "defaultTipPercentage")
        defaults.set(currentValue, forKey:"defaultTipLabel")
        defaults.synchronize()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
