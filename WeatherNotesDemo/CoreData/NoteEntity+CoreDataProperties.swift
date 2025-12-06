//
//  NoteEntity+CoreDataProperties.swift
//  WeatherNotesDemo
//
//  Created by Cosmos on 05.12.2025.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var temperature: Double
    @NSManaged public var weatherDescription: String?
    @NSManaged public var weatherIcon: String?
    @NSManaged public var cityName: String?

}

extension NoteEntity : Identifiable {

}
