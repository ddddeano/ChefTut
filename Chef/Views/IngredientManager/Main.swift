//
//  Main.swift
//  Chef
//
//  Created by Daniel Watson on 08/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI

struct IngredientManager: View {
    var body: some View {
        TabView {
            IngredientList()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Ingredients")
            }
            SupplierList()
                .tabItem {
                    Image(systemName: "circle.grid.hex")
                    Text("Suppliers")
            }
            CategoryList()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Categories")
            }
        }
    }
}
