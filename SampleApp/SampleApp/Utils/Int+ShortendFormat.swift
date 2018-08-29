//
//  Int+ShortendFormat.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

extension Int {
   
    func shortendFormat() -> String {
        
        let rule = formattingRule(value: self, ruleset: intFormattingRules())
        
        let value = Double(self)/rule.divider
        
        let formatter = NumberFormatter()
        formatter.negativeSuffix = rule.suffix
        formatter.positiveSuffix = rule.suffix
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        formatter.minimumIntegerDigits = 1
        formatter.allowsFloats = true
        
        let formattedInt = formatter.string(from: NSNumber(value: value))
        
        return formattedInt!
    }
    
    func formattingRule(value: Int, ruleset: [FormattingRule]) -> FormattingRule {
        
        var rule = ruleset[0]
        
        for r in ruleset {
            
            if (value < Int(r.bound)) {
                rule = r
                break
            }
        }
        
        return rule
    }
    
    func intFormattingRules() -> [FormattingRule] {
    
        return [(1_000, 1, ""),
                (1_000_000, 1_000, "k"),
                (1_000_000_000, 1_000_000, "M"),
                (1_000_000_000_000, 1_000_000_000, "B")]
    }
}
