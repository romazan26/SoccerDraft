//
//  Player+CoreDataProperties.swift
//
//
//  Created by Роман on 04.08.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Player)
public class Player:NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var age: Int16
    @NSManaged public var photo: UIImage?
    @NSManaged public var playerName: String?
    @NSManaged public var posr: String?
    @NSManaged public var team: String?

}

extension Player : Identifiable {

}
