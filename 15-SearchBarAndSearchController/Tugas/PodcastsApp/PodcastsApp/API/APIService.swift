import Foundation
import Alamofire

class APIService: Service {
    static let shared = APIService()
    private init() { }
    
    private let SEARCH_URL: String = "https://itunes.apple.com/search"
    
    
    func searchPodcasts(q: String, completion: @escaping (Result<[Podcast], Error>) -> Void) {
        let parameters: [String: Any] = [
            "media": "podcast",
            "term": q
        ]
        AF.request(SEARCH_URL, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseDecodable(of: SearchResponse.self, completionHandler: { (response) in
                switch response.result {
                case.success(let searchResponse):
                    completion(.success(searchResponse.results))
                    
                case.failure(let error):
                    completion(.failure(error))
                }
            })
    }
     
    
    
}
