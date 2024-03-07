//
//  NetworkManager.swift
//  Altimetrik
//
//  Created by Monish M on 07/03/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://mocki.io/v1/"
    private let postsURL = baseURL + "22cd2c33-f22f-4ac5-a7de-6be7fe1d3803"
    
    private init() {}
    
    func fetchPostData() async throws -> [PostDetailModel] {
        guard let url = URL(string: postsURL) else {
            throw NSError()
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let postData = try JSONDecoder().decode(PostsModel.self, from: data)
        
        return postData.posts
    }
    
}
