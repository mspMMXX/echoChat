//
//  PostView.swift
//  echoChat
//
//  Created by Markus Platter on 04.03.25.
//

import SwiftUI

struct PostView: View {
    
    var user: User?
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                Text(user?.username ?? "UserName")
                    .font(.headline)
                Spacer()
                Button {
                    print("Gedrückt")
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.black)
                }
            }
            .padding(20)
            Text("Das ist die Nachricht.")
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 400, alignment: .leading)
        .background(.gray)
    }
}

#Preview {
    PostView()
}
