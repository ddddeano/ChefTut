//
//  IngredientManagerSheets.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI

struct AddIngredientSheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    
    @FetchRequest(entity: Supplier.entity(), sortDescriptors: [])
    var suppliers: FetchedResults<Supplier>
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
    
    @State private var ingredientName = ""
    @State private var category = Category()
    @State private var supplier = Supplier()
    @State private var isFave = false
    
    
    var body: some View {
        Form {
            HStack {
                TextField("Name", text: $ingredientName)
                Image(systemName: isFave ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        self.isFave.toggle()
                }
            }
            
            Picker("Supplier", selection: $supplier) {
                ForEach(suppliers, id: \.self) { supplier in
                    Text(supplier.wrappedName)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) { category in
                    Text(category.wrappedName)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Save") {
                
                let newPurchase = Purchase(context: self.moc)
                newPurchase.id = UUID()
                newPurchase.ingredient = Ingredient(context: self.moc)
                newPurchase.ingredient?.id = UUID()
                newPurchase.ingredient?.name = self.ingredientName
                newPurchase.ingredient?.category = self.category
                newPurchase.supplier = self.supplier
                newPurchase.isFave = self.isFave
                
                try? self.moc.save()
                self.pm.wrappedValue.dismiss()
                
            }
        }
    }
}

struct AddIngredientSheet_Previews: PreviewProvider {
    static var previews: some View {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let category = Category(context: moc)
        category.name = "Dairy"
        let supplier = Supplier(context: moc)
        supplier.name = "Tesco"
        let purchase = Purchase(context: moc)
        purchase.isFave = false
        return
            AddIngredientSheet().environment(\.managedObjectContext, moc)
    }
}


struct AddSupplierSheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    
    
    @State private var supplierName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $supplierName)
            
            Button("Save") {
                
                let newSupplier = Supplier(context: self.moc)
                newSupplier.name = self.supplierName
                
                try? self.moc.save()
                self.pm.wrappedValue.dismiss()
                
            }
        }
    }
}

struct AddCategorySheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    @State private var name = ""
    
    var body: some View {
        VStack {
            TextField("Add Category Name", text: $name)
            Button("Save") {
                let newCategory = Category(context: self.moc)
                newCategory.name = self.name
                
                try? self.moc.save()
                self.pm.wrappedValue.dismiss()
            }
        }
    }
}


