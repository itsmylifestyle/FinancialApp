//
//  Items.swift
//  FinancialApp
//
//  Created by Айбек on 17.11.2022.
//

import SwiftUI

struct ExepnseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expences: ObservableObject {
    @Published var item = [ExepnseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(item) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExepnseItem].self, from: items) {
                self.item = decoded
                return
            }
        }
    }
}
