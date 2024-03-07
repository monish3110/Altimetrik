//
//  PostListViewModel.swift
//  Altimetrik
//
//  Created by Monish M on 07/03/24.
//

import SwiftUI

@MainActor final class PostListViewModel: ObservableObject {
    
    @Published var postsData: [PostDetailModel] = []
    @Published var isLoading = false
    @Published var selectedPost: PostDetailModel?
    @Published var isShowingDetail = false
    
    func getPostsData() {
        isLoading = true
        
        Task {
            do {
                postsData = try await NetworkManager.shared.fetchPostData()
                isLoading = false
            } catch {
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }
}
