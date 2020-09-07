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
    
    
    @State private var ingredientName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $ingredientName)
            
            Button("Save") {
                
                let newIngredient = Ingredient(context: self.moc)
                newIngredient.name = self.ingredientName
                
                try? self.moc.save()
                self.pm.wrappedValue.dismiss()
                
            }
        }
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

