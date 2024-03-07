//
//  PostDetailView.swift
//  Altimetrik
//
//  Created by Monish M on 07/03/24.
//

import SwiftUI

struct PostDetailView: View {
    
    let selectedPost: PostDetailModel?
    
    var body: some View {
        if let data = selectedPost {
            PostsUIView(postData: data)
                .padding(.leading,20)
        } else { Text("No Record Found") }
        Spacer()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(selectedPost: PostDetailModel(id: "1", author: AuthorModel(nickName: "John"), created: "oct", title: "developer", content: "test", reactions: [Reactions(count: 1)]))
    }
}
