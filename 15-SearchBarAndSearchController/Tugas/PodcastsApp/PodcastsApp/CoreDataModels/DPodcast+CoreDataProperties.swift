//
//  DPodcast+CoreDataProperties.swift
//  
//
//  Created by Armstrong on 30/10/22.
//
//

import Foundation
import CoreData


extension DPodcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DPodcast> {
        return NSFetchRequest<DPodcast>(entityName: "DPodcast")
    }

    @NSManaged public var trackId_: Int64
    @NSManaged public var trackname: String
    @NSManaged public var trackCount_: Int16
    @NSManaged public var artistName: String
    @NSManaged public var artWork: String
    @NSManaged public var feedUrl: String
    @NSManaged public var isFavorited: Bool

}

extension DPodcast: Identifiable {
    
}
