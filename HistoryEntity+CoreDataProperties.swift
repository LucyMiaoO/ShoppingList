//
//  HistoryEntity+CoreDataProperties.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/10.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import Foundation
import CoreData


extension HistoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoryEntity> {
        return NSFetchRequest<HistoryEntity>(entityName: "HistoryEntity")
    }

    @NSManaged public var purchased: Bool
    @NSManaged public var purchasedItems: NSSet?

}

// MARK: Generated accessors for purchasedItems
extension HistoryEntity {

    @objc(addPurchasedItemsObject:)
    @NSManaged public func addToPurchasedItems(_ value: ItemEntity)

    @objc(removePurchasedItemsObject:)
    @NSManaged public func removeFromPurchasedItems(_ value: ItemEntity)

    @objc(addPurchasedItems:)
    @NSManaged public func addToPurchasedItems(_ values: NSSet)

    @objc(removePurchasedItems:)
    @NSManaged public func removeFromPurchasedItems(_ values: NSSet)

}
