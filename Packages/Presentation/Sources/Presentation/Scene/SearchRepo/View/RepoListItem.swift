//
//  RepoListItem.swift
//  
//
//  Created by Domon on 2022/05/12.
//

import SwiftUI
import AppCore
import Kingfisher

struct RepoListItem: View {
    
    // @ObservedObject
    private var repo: GitHubRepository
    
    init(repo: GitHubRepository) {
        self.repo = repo
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                KFImage(repo.owner.avatarUrl)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .scaledToFit()
                    .cornerRadius(17)
                VStack(alignment: .leading, spacing: 0) {
                    Text(repo.fullName)
                    Text(repo.owner.login)
                        .bold()
                }
            }
            Text(repo.description ?? "")
                .lineLimit(2)
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "star")
                    Text("\(repo.stargazersCount)")
                }
                Text(repo.language ?? "")
            }
            Button {
                print("did tap")
            } label: {
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star")
                    Text("Star")
                }
                .frame(maxWidth: .infinity, minHeight: 40)
                .contentShape(Rectangle())
                .background(Color(UIColor.lightGray))
            }
            .buttonStyle(AnimateButtonStyle())
        }
    }
}
