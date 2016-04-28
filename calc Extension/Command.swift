//
//  Command.swift
//  calculator
//
//  Created by Hari Krishna Bodicharla on 4/28/16.
//  Copyright © 2016 bodicharla. All rights reserved.
//

import WatchKit

enum CommandType
{
    case Divide
    case Multiply
    case Subtract
    case Add
}

class Command: NSObject {
    
    var type: CommandType
    let oldValue: Double
    
    init(type: CommandType, oldValue: Double)
    {
        self.type = type
        self.oldValue = oldValue
        super.init()
    }
    
    func executeWithNewValue(newValue: Double) -> Double
    {
        var result = oldValue
        
        // check current type and do appropriate calculation
        switch type
        {
        case .Divide: result /= newValue
        case .Multiply: result *= newValue
        case .Subtract: result -= newValue
        case .Add: result += newValue
        }
        
        return result
    }

}
