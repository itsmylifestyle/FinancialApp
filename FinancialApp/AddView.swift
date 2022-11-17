//
//  AddView.swift
//  FinancialApp
//
//  Created by Айбек on 17.11.2022.
//

import SwiftUI

struct AddView : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expences: Expences
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Business", "Personal"]
    
    var body : some View {
        NavigationView {
            Form {
                TextField("Appelation", text: $name)
                Picker("type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExepnseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expences.item.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews : PreviewProvider {
    static var previews: some View {
        AddView(expences: Expences())
    }
}
