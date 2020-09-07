//
//  Purchase+CoreDataProperties.swift
//  Chef
//
//  Created by Daniel Watson on 03/09/2020.
//  Copyright © 2020 Daniel Watson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Purchase)
public class Purchase: NSManagedObject {
    
}

extension Purchase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Purchase> {
        return NSFetchRequest<Purchase>(entityName: "Purchase")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isFave: Bool
    @NSManaged public var qty: String?
    @NSManaged public var unit: String?
    @NSManaged public var price: String?
    @NSManaged public var ingredient: Ingredient?
    @NSManaged public var supplier: Supplier?

}
