//
//  ContentView.swift
//  FinancialApp
//
//  Created by Айбек on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    
    @ObservedObject var expences = Expences()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expences.item) { items in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(items.name)
                                .font(.headline)
                            
                            Text(items.type)
                        }
                        
                        Spacer()
                        
                        Text("$\(items.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("My expences")
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddExpense) {
                AddView(expences: self.expences)
            }
        }
    }
    func removeItems(as offsets: IndexSet) {
        expences.item.remove(atOffsets: offsets)
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
