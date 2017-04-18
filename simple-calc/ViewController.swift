//
//  ViewController.swift
//  simple-calc
//
//  Created by Patricia Au on 4/15/17.
//  Copyright © 2017 Patricia Au. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var arr = [""]
    var index = 0
    //Handles numbers and operator buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonText = sender.currentTitle!
        //Adding numbers into array
        if Double(buttonText) != nil || buttonText == "."  {
            arr[index].append(buttonText)
        } else {
            arr.append(buttonText)
            arr.append("")
            index += 2
        }
        //Change resultField content
        if resultField.text == "0" {
            resultField.text = ("\(buttonText)")
        } else {
            resultField.text?.append("\(buttonText)")
        }
        
        print("Button text: \(buttonText)")
        print("Arr: \(arr)")
    }
    
    @IBAction func factPressed(_ sender: UIButton) {
        index += 1
        var factValue = 1
        if UInt(arr[0]) == nil {
            resultField.text = "Invalid input provided"
        } else {
            for num in 1...Int(arr[0])! {
                factValue *= num
            }
            resultField.text = String(factValue)
        }
        arr = ["\(factValue)"]
        index = 0
    }

    @IBAction func equalsPressed(_ sender: UIButton) {
        var count = 1
        var runningTotal: Double = Double(arr[0])!
        index = 0
        while (index < arr.count) {
            switch arr[index] {
            case "+":
                runningTotal += Double(arr[index + 1])!
                index += 2
            case "-":
                runningTotal -= Double(arr[index + 1])!
                index += 2
            case "x":
                runningTotal *= Double(arr[index + 1])!
                index += 2
            case "/":
                runningTotal /= Double(arr[index + 1])!
                index += 2
            case "count":
                runningTotal = 0
                count += 1
                index += 2
            case "avg":
                count += 1
                runningTotal += Double(arr[index + 1])!
                index += 2
            default: //number
                index += 1
            }
            print("Running total: \(runningTotal)")
            
        }
        //This is probably actually really bad - this is here because of avg
        runningTotal /= Double(count)
        
        arr = [""]
        index = 0
        var strAppend: String = String("\(runningTotal)")
        if runningTotal != 0 {

            //If strAppend ends with .0, remove it
            if strAppend.hasSuffix(".0") {
                let endIndex = strAppend.index(strAppend.endIndex, offsetBy: -2)
                strAppend = strAppend.substring(to: endIndex)
            }
            //Change resultField to the calculated value
            resultField.text = String("\(strAppend)")
        } else {
            resultField.text = ("\(count)")
            strAppend = "\(count)"
            count = 1
        }
        //Make the first index the new calculated result
        arr[index].append(String(strAppend))
        print("Removed nums \(arr)")

    }

    //Clear pressed
    @IBAction func clearPressed(_ sender: Any) {
        arr = [""]
        index = 0
        resultField.text = "0"
    }
}

