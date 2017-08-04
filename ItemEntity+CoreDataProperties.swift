//
//  ItemEntity+CoreDataProperties.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/10.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int32
    @NSManaged public var title: String?
    @NSManaged public var isPurchased: HistoryEntity?

}
