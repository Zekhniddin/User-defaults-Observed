//
//  Defaults.swift
//  User-defaults-Observed
//
//  Created by Зехниддин on 03/02/21.
//

import Foundation

class Defaults: ObservableObject {
    
    @Published var account: Account? {
        didSet {
            storeAccount(account: account ?? Account(holderName: "", cardNumber: "", accountBalance: "", spendingLimit: ""))
        }
    }
    
    init() {
        self.account = loadAccount()
    }
    
    func storeAccount(account: Account) {
        let encoder = JSONEncoder()
        if let encodedAccount = try? encoder.encode(account) {
            UserDefaults.standard.set(encodedAccount, forKey: "account")
        }
    }
    
    func loadAccount() -> Account? {
        if let savedAccountData = UserDefaults.standard.object(forKey: "account") as? Data {
            let decoder = JSONDecoder()
            if let savedAccount = try? decoder.decode(Account.self, from: savedAccountData) {
                return savedAccount
            }
        }
        return nil
    }
}
