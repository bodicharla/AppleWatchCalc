//
//  InterfaceController.swift
//  calc Extension
//
//  Created by Hari Krishna Bodicharla on 4/27/16.
//  Copyright © 2016 bodicharla. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    var currentValue: String = "0"
    var calculationExecuted = false
    var command: Command?
    
    
    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    func numberPressed(value: Int)
    {
        let newValue = "\(value)"
        
        // whenever the current value is 0 and whenever a calculation has
        // been executed we want to replace the value with the number pressed
        if currentValue == "0" || calculationExecuted
        {
            calculationExecuted = false
            currentValue = newValue
        }
        else
        {
            // append stringvalue of the pressed button to current value
            currentValue += newValue
        }
        
        displayLabel.setText(currentValue)
    }
   
    @IBAction func button0Tapped() {
        
        numberPressed(0)
        
    }

    @IBAction func button1Tapped() {
         numberPressed(1)
    }
    @IBAction func button2Tapped() {
         numberPressed(2)
    }
    
    @IBAction func button3Tapped() {
        numberPressed(3)
    }
    
    @IBAction func button4Tapped() {
        numberPressed(4)
    }
    
    @IBAction func button5Tapped() {
        numberPressed(5)
    }
    
    @IBAction func button6Tapped() {
        numberPressed(6)
    }
    
    @IBAction func button7Tapped() {
        numberPressed(7)
    }
    
    @IBAction func button8Tapped() {
        numberPressed(8)
    }
    
    @IBAction func button9Tapped() {
        numberPressed(9)
    }
    
    @IBAction func clearTapped()
    {
        command = nil
        currentValue = "0"
        displayLabel.setText(currentValue)
    }
    
    @IBAction func decimalTapped()
    {
        // check if dot sign already exists in current value
        // we only want to add it once
        if currentValue.rangeOfString(".") == nil
        {
            currentValue += "."
            displayLabel.setText(currentValue)
        }
    }
    
    
    func commandTapped(type: CommandType)
    {
        calculationExecuted = false
        if command != nil
        {
            command!.type = type
            print("again tapped")
        }
        else
        {
            command = Command(type: type, oldValue: (currentValue as NSString).doubleValue)
            currentValue = "0"
        }
    }
    
    
    @IBAction func addTapped()
    {
        commandTapped(.Add)
    }
    
    @IBAction func subtractTapped()
    {
        commandTapped(.Subtract)
    }
    
    @IBAction func multiplyTapped()
    {
        commandTapped(.Multiply)
    }
    
    @IBAction func divideTapped()
    {
        commandTapped(.Divide)
    }
    
    func setDisplayValue(value: Double)
    {
        //  check if value is an integer
        if value % 1 == 0
        {
            // our value is an integer
            currentValue = "\(Int(value))"
        }
        else
        {
            // our value is a float
            currentValue = "\(value)"
        }
        
        displayLabel.setText(currentValue)
    }
    
    @IBAction func answerTapped()
    {
        // only do calculation if a command has been selected
        if command != nil
        {
            let answer = command!.executeWithNewValue((currentValue as NSString).doubleValue)
            setDisplayValue(answer)
            command = nil
            calculationExecuted = true
        }
    }
    
    
}
