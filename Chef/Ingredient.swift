//
//  Ingredient+CoreDataProperties.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Ingredient)
public class Ingredient: NSManagedObject {
    
}

extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var purchases: NSSet?
    
    public var wrappedName: String {
        name ?? "unknown"
    }
    
    public var purchaseArray: [Purchase] {
        let set = purchases as? Set<Purchase> ?? []
        
        return set.sorted {
            $0.supplier!.wrappedName < $1.supplier!.wrappedName
                }
            }

}

// MARK: Generated accessors for purchases
extension Ingredient {

    @objc(addPurchasesObject:)
    @NSManaged public func addToPurchases(_ value: Purchase)

    @objc(removePurchasesObject:)
    @NSManaged public func removeFromPurchases(_ value: Purchase)

    @objc(addPurchases:)
    @NSManaged public func addToPurchases(_ values: NSSet)

    @objc(removePurchases:)
    @NSManaged public func removeFromPurchases(_ values: NSSet)

}
