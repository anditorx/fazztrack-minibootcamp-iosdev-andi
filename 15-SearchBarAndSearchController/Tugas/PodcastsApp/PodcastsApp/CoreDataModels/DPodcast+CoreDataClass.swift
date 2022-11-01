//
//  DPodcast+CoreDataClass.swift
//  
//
//  Created by Armstrong on 30/10/22.
//
//

import Foundation
import CoreData


public class DPodcast: NSManagedObject {
    static let favoritedPodcastKey = "favoritedPodcastKey"

    class func save(_ podcast: Podcast, at context: NSManagedObjectContext) {
        
        let request: NSFetchRequest<DPodcast> = DPodcast.fetchRequest()
        request.predicate = NSPredicate(format: "trackId_ = \(podcast.trackId)")
        
        let entity: DPodcast
        if let dPodcast = try? context.fetch(request).first {
            entity = dPodcast
        }
        else {
            let dPodcast = NSEntityDescription.entity(forEntityName: "DPodcast", in: context)!
            entity = NSManagedObject(entity: dPodcast, insertInto: context) as! DPodcast
        }
      
        entity.trackId_ = Int64(podcast.trackId)
        entity.trackname = podcast.trackName
        entity.trackCount_ = Int16(podcast.trackCount)
        entity.artistName = podcast.artistName
        entity.artWork = podcast.artworkUrl600
        entity.feedUrl = podcast.feedUrl
        entity.isFavorited = true
        try? context.save()
        
    }
    
//    func savedPodcasts() -> [Podcast] {
//            guard let savedPodcastsData = UserDefaults.standard.data(forKey: UserDefaults.favoritedPodcastKey) else { return [] }
//
//            guard let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: savedPodcastsData) as? [Podcast] else { return [] }
//            return savedPodcasts
//        }
    
    class func fetch(in context: NSManagedObjectContext) -> [Podcast] {
        let request: NSFetchRequest<DPodcast> = DPodcast.fetchRequest()
        request.predicate = NSPredicate(format: "isFavorited = \(true)")
        let podcasts = (try? context.fetch(request)) ?? []
        return podcasts //.sorted { $0.trackId < $1.trackId }
    }
    
    class func fetch(trackId: Int, at context: NSManagedObjectContext) -> Podcast? {
        let request: NSFetchRequest<DPodcast> = DPodcast.fetchRequest()
        request.predicate = NSPredicate(format: "trackId_ = \(trackId) AND isFavorited = \(true)")
        return try? context.fetch(request).first
    }
    
    class func delete(trackId: Int, at context: NSManagedObjectContext) {
        if let entity = DPodcast.fetch(trackId: trackId, at: context) as? DPodcast {
//            context.delete(entity as! NSManagedObject)
            entity.isFavorited = false
            
            try? context.save()
        }
    }
    
}


extension DPodcast: Podcast {
    var trackName: String {
        return artistName
    }
    
    var trackId: Int {
        return Int(trackId_)
    }
    
    var trackCount: Int {
        return Int(trackCount_)
    }
    
    var artworkUrl600: String {
        return feedUrl
    }
    
    
}
