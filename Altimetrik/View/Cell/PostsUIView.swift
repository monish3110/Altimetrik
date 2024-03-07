//
//  PostsUIView.swift
//  Altimetrik
//
//  Created by Monish M on 06/03/24.
//

import SwiftUI

struct PostsUIView: View {
    
    let postData: PostDetailModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack(spacing: 10) {
                Rectangle()
                    .fill(.white)
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 10) {
                    Text(postData.author.nickName)
                        .font(.system(size: 20, weight: .medium))
                    Text(postData.created.toDisplayDateFormat ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                }
                Spacer()
            }
            Text(postData.title)
                .font(.system(size: 25, weight: .semibold))
            Text(postData.content)
                .font(.system(size: 20, weight: .regular))
            
            HStack(spacing: 30) {
                ButtonImageView(title: "Replies", imageName: "bubble.left.fill")
                ButtonImageView(title: "Share", imageName: "arrowshape.turn.up.forward.fill")
                ButtonImageView(title: "React", imageName: "hand.thumbsup.fill")
                
                ZStack {
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .foregroundColor(.cyan)
                        .frame(width: 18, height: 18)
                        .offset(x: 25)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .frame(width: 18, height: 18)
                        .offset(x: 13)
                    Image(systemName: "heart.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 18, height: 18)
                    Text("\(postData.reactions.reduce(0) { $0 + $1.count })")
                        .font(.system(size: 16, weight: .regular))
                        .offset(x: 50)
                }
            }
        }
        Rectangle()
            .fill(.bar)
            .frame(height: 1)
    }
}

struct PostsUIView_Previews: PreviewProvider {
    static var previews: some View {
        PostsUIView(postData: PostDetailModel(id: "1", author: AuthorModel(nickName: "Jack"), created: "31-10-1993", title: "IOS Developer", content: "SwiftUI", reactions: [Reactions(count: 1)]))
    }
}
