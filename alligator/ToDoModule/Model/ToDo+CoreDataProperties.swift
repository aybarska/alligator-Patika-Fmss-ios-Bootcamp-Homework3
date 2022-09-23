//
//  ToDo+CoreDataProperties.swift
//  
//
//  Created by Ayberk M on 22.09.2022.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var td_createdDate: Date?
    @NSManaged public var td_description: String?
    @NSManaged public var td_isEvaluated: Bool
    @NSManaged public var td_title: String?
    @NSManaged public var td_id: Int32

}
