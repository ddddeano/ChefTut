//
//  IngredientManagerViews.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI
import CoreData

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
            PurchaseList()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("purchases")
            }
        }
    }
}

struct IngredientList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [])
    var ingredients: FetchedResults<Ingredient>
    
    @State private var showAdd = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ingredients List")
                ForEach(ingredients, id: \.self) { ingredient in
                    Text("I am an Ingredient")
                }
            }
            .navigationBarTitle("Ingredients", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showAdd.toggle()
            }) {
                Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showAdd) {

                AddIngredientSheet().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}


struct SupplierList: View {
        @Environment(\.managedObjectContext) var moc
        @FetchRequest(entity: Supplier.entity(), sortDescriptors: [])
        var suppliers: FetchedResults<Supplier>
        
        @State private var showAdd = false
        
        var body: some View {
            NavigationView {
                VStack {
                    Text("Suppliers List")
                    ForEach(suppliers, id: \.self) { supplier in
                        Text("I am a Supplier")
                    }
                }
                .navigationBarTitle("suppliers", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showAdd.toggle()
                }) {
                    Image(systemName: "plus")
                    }
                )
                    .sheet(isPresented: $showAdd) {

                    AddSupplierSheet().environment(\.managedObjectContext, self.moc)
                }
            }
        }
    }


struct PurchaseList: View {
        @FetchRequest(entity: Purchase.entity(), sortDescriptors: [])
        var purchases: FetchedResults<Purchase>
        
        var body: some View {
            NavigationView {
                VStack {
                    Text("purchases List")
                    ForEach(purchases, id: \.self) { purchase in
                        Text("I am a Purchase")
                    }
                }
                .navigationBarTitle("purchases", displayMode: .inline)
            }
        }
    }

