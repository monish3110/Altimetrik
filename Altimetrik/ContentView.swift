//
//  ContentView.swift
//  Altimetrik
//
//  Created by Monish M on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModal = PostListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModal.postsData, id: \.id) { post in
                PostsUIView(postData: post)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModal.selectedPost = post
                    viewModal.isShowingDetail = true
                }
            }
            .navigationDestination(isPresented: $viewModal.isShowingDetail) {
                PostDetailView(selectedPost: viewModal.selectedPost)
                         }
            .listStyle(PlainListStyle())
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .task {
            viewModal.getPostsData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
