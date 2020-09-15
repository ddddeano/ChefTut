//
//  IngredientManagerViews.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI
import CoreData

struct IngredientList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [])
    var ingredients: FetchedResults<Ingredient>
    
    @State private var showAdd = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(ingredients, id: \.self) { ingredient in
                    NavigationLink(destination: IngredientDetail(ingredient: ingredient)) {
                        IngredientCard(ingredient: ingredient)
                    }
                }.onDelete { IndexSet in
                    let deleteItem = self.ingredients[IndexSet.first!]
                    self.moc.delete(deleteItem)
                    
                    try? self.moc.save()
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
                List {
                    ForEach(suppliers, id: \.self) { supplier in
                        Text(supplier.wrappedName)
                    }.onDelete { IndexSet in
                    let deleteItem = self.suppliers[IndexSet.first!]
                    self.moc.delete(deleteItem)
                    
                    try? self.moc.save()
                }
                }
                .navigationBarTitle("Suppliers", displayMode: .inline)
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




struct CategoryList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
    @State private var showAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.self) { category in
                    Text(category.wrappedName)
                }.onDelete { IndexSet in
                let deleteItem = self.categories[IndexSet.first!]
                self.moc.delete(deleteItem)
                
                try? self.moc.save()
                }
            }
            .navigationBarTitle("categories", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showAdd.toggle()
            }) {
                Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showAdd) {

                AddCategorySheet().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}
// REDUNDANT FOR NOW BUT SOUND CODE
//struct PurchaseList: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Purchase.entity(), sortDescriptors: [])
//    var purchases: FetchedResults<Purchase>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(purchases, id: \.self) { purchase in
//                    PurchaseCard(purchase: purchase, isFave: purchase.isFave)
//                }.onDelete { IndexSet in
//                    let deleteItem = self.purchases[IndexSet.first!]
//                    self.moc.delete(deleteItem)
//
//                    try? self.moc.save()
//                }
//            }
//            .navigationBarTitle("Purchases", displayMode: .inline)
//        }
//    }
//}
