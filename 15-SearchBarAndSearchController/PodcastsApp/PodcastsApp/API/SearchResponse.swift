//
//  SearchResponse.swift
//  PodcastsApp
//
//  Created by Armstrong on 28/10/22.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [Podcast]
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount) ?? 0
        results = try container.decodeIfPresent([Podcast_].self, forKey: .results) ?? []
    }
}
