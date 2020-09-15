//
//  Details.swift
//  Chef
//
//  Created by Daniel Watson on 11/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI
import CoreData

struct IngredientDetail: View {
    @FetchRequest(entity: Purchase.entity(), sortDescriptors: [])
    var purchases: FetchedResults<Purchase>
    
    
    var ingredient: Ingredient

    
    var body: some View {
        ForEach(ingredient.purchaseArray, id: \.self)  { purchase in
            PurchaseCard(purchase: purchase)
        }
    }
}

struct IngredientDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let purchase1 = Purchase(context: moc)
        purchase1.supplier?.name = "Veg Store"
        purchase1.isFave = true
        
        let purchase2 = Purchase(context: moc)
        purchase2.supplier?.name = "Tescos"
        purchase2.isFave = false
        
        let ingredient = Ingredient(context: moc)
        ingredient.addToPurchases(purchase1)
        ingredient.addToPurchases(purchase2)
        
        
        return IngredientDetail(ingredient: ingredient).environment(\.managedObjectContext, moc)
    }
}

