//
//  Date+Extension.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

typealias FormattingRule = (bound: Double, divider: Double, suffix: String)

extension Date {
    
    func timeAgo() -> String {
        
        if !validateDateInPast() {
            print("Date.timeAgo(): target date is in future")
            
            return ""
        }
        
        let timeInterval = Date().timeIntervalSince(self)
        
        let rule = formattingRule(timeInterval: timeInterval, ruleset: timeAgoFormattingRules())
        
        let value = Int(floor(timeInterval/rule.divider))
        
        return "\(value)\(rule.suffix)"
        
    }
    
    private func formattingRule(timeInterval: Double, ruleset: [FormattingRule]) -> FormattingRule {
        
        var rule = ruleset[0]
        
        for r in ruleset {
            if(timeInterval < r.bound) {
                rule = r
                break
            }
        }
        
        return rule
    }
    
    private func timeAgoFormattingRules() -> [FormattingRule] {
        
        return [(60 , 1, "s ago"),
                (60 * 60, 60, "m ago"),
                (60 * 60 * 24, 60 * 60, "h ago"),
                (60 * 60 * 24 * 365, 60 * 60 * 24, "d ago"),
                (60 * 60 * 24 * 365 * 100, 60 * 60 * 24 * 365, "y ago")]
    }
    
    private func validateDateInPast() -> Bool {
        
        return self.compare(Date()) == ComparisonResult.orderedAscending
    }
}
