//
//  BillTip.swift
//  Tipsy
//
//  Created by Sergii Shamrai on 09.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct BillTip {
    
    var bill: Float
    var tip: Float
    var split: Int
    
    func getBillPerPerson() -> String {
        return String(format: "%.1f", (bill * (1 + tip)) / Float(split) )
    }
}
