//
//  Supplier+CoreDataProperties.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Supplier)
public class Supplier: NSManagedObject {
    
}

extension Supplier {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Supplier> {
        return NSFetchRequest<Supplier>(entityName: "Supplier")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var purchases: NSSet?
    
    public var wrappedName: String {
        name ?? "unknown"
    }
    
    public var purchaseArray: [Purchase] {
        let set = purchases as? Set<Purchase> ?? []
        
        return set.sorted {
            $0.ingredient!.wrappedName < $1.ingredient!.wrappedName
                }
            }

}

// MARK: Generated accessors for purchases
extension Supplier {

    @objc(addPurchasesObject:)
    @NSManaged public func addToPurchases(_ value: Purchase)

    @objc(removePurchasesObject:)
    @NSManaged public func removeFromPurchases(_ value: Purchase)

    @objc(addPurchases:)
    @NSManaged public func addToPurchases(_ values: NSSet)

    @objc(removePurchases:)
    @NSManaged public func removeFromPurchases(_ values: NSSet)

}
