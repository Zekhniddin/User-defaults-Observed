//
//  Account.swift
//  User-defaults-Observed
//
//  Created by Зехниддин on 03/02/21.
//

import Foundation

struct Account: Codable {
    var holderName: String
    var cardNumber: String
    var accountBalance: String
    var spendingLimit: String
}
