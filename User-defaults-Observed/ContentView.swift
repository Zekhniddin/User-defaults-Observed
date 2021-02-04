//
//  ContentView.swift
//  User-defaults-Observed
//
//  Created by Зехниддин on 03/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dafaults = Defaults()
    
    init() {
        dafaults.account = Account(holderName: "Zehniddin", cardNumber: "1233 4342 4243 4324", accountBalance: "45 $", spendingLimit: "95 $")
    }
    
    var body: some View {

        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Holder name: ") + Text(dafaults.loadAccount()?.holderName ?? "no data")
                    .fontWeight(.medium)
                Text("Card number: ") + Text(dafaults.loadAccount()?.cardNumber ?? "no data")
                    .fontWeight(.medium)
                Text("Account Balance: ") + Text(dafaults.loadAccount()?.accountBalance ?? "no data")
                    .fontWeight(.medium)
                Text("Spending Limit: ") + Text(dafaults.loadAccount()?.spendingLimit ?? "no data")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .font(.system(size: 14))
            .navigationBarTitle("Local storage", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
