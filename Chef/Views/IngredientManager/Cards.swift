//
//  Cards.swift
//  Chef
//
//  Created by Daniel Watson on 07/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//

import SwiftUI
import CoreData

struct IngredientCard: View {
    var ingredient: Ingredient
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("blue"))
                .frame(height: 60)
                .cornerRadius(10)
                .shadow(radius: 30)
            HStack {
                Text(ingredient.wrappedName).bold()
                Spacer()
                Text(ingredient.category!.wrappedName)
                    .fontWeight(.light)
            }
            .foregroundColor(Color("lemon"))
            .padding(40)
        }.padding(.horizontal, 20.0)
    }
}

struct SupplierCard: View {
    var supplier: Supplier
    var body: some View {
        Text(supplier.wrappedName)
    }
}

struct CategoryCard: View {
    var category: Category
    var body: some View {
        Text(category.wrappedName)
    }
}

struct PurchaseCard: View {
    @Environment(\.managedObjectContext) var moc
    
    var purchase: Purchase
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("red"))
                .frame(height: 60)
                .cornerRadius(10)
                .shadow(radius: 30)
            HStack() {
                Image(systemName: purchase.isFave ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        
                        try? self.moc.save()
                }
                
                Text(purchase.ingredient!.wrappedName).bold()
                Spacer()
                Text(purchase.supplier!.wrappedName).fontWeight(.light)
            }
            .foregroundColor(Color("lemon"))
            .padding(40)
        }.padding(.horizontal, 20.0)
    }
}





//struct Cards_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//    
//    static var previews: some View {
//        let ingredient = Ingredient(context: moc)
//        ingredient.name = "Lemon"
//        ingredient.category = Category(context: moc)
//        ingredient.category!.name = "Fruit"
//        
//        let purchase = Purchase(context: moc)
//        purchase.ingredient = Ingredient(context: moc)
//        purchase.ingredient?.name = "Fruit"
//        purchase.supplier = Supplier(context: moc)
//        purchase.supplier?.name = "Tesco"
//        purchase.isFave = true
//        
//        
//        return
//            VStack {
//                NavigationView {
//                    IngredientCard(ingredient: ingredient)
//                }
//                NavigationView {
//                    PurchaseCard(purchase: purchase, isFave: purchase.isFave, ingredient: ingredient).environment
//                }
//        }
//    }
//}
//        let supplier = Supplier(context: moc)
//        let category = Category(context: moc)
//                SupplierCard(supplier: supplier)
//                CategoryCard(category: category)
