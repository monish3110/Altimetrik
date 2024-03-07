//
//  ButtonImageView.swift
//  Altimetrik
//
//  Created by Monish M on 07/03/24.
//

import SwiftUI

struct ButtonImageView: View {
    
    var title: String
    var imageName: String
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.blue)
                    .frame(width: 14, height: 14)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
}
