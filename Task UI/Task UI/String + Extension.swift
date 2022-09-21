//
//  Extension + String.swift
//  Task UI
//
//  Created by Mohan on 21/09/22.
//

import Foundation

extension String{
    
    func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        var passRegEx = ""
        if mini >= max{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }else{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    //https://stackoverflow.com/a/39284766/8201581
    
    func applyPredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
