//
//  SearchRepoView.swift
//  Presentation
//
//  Created by Domon on 2022/04/14.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import SwiftUI
import Kingfisher

protocol SearchRepoViewInput: AnyObject {
    // func repoListViewSearchRepositories(searchQuery: String)
    // func repoListViewLoadMoreRepositories()
    // func repoListViewDidTapRepository(_ repository: GitHubRepository)
}

struct SearchRepoView: View {
    
    private weak var input: SearchRepoViewInput?
    
    @ObservedObject
    private var dataSource: DataSource
    
    init(input: SearchRepoViewInput?, dataSource: DataSource) {
        self.input = input
        self.dataSource = dataSource
    }
    
    var body: some View {
        List {
            ForEach(dataSource.repositories) { r in
                RepoListItem(repo: r)
            }
        }.listStyle(PlainListStyle())
    }
    
    private func repoView(repo: GitHubRepository) -> some View {
        return VStack(alignment: .leading, spacing: 4) {
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

// MARK: - DataSource
extension SearchRepoView {
    class DataSource: ObservableObject {
        @Published var repositories = [GitHubRepository]()
    }
}

extension SearchRepoView.DataSource {
    static let mock: SearchRepoView.DataSource = {
        let mock = SearchRepoView.DataSource()
        //mock.inputText = "Swift"
        mock.repositories = [
            .init(
                id: 1,
                name: "y-okudera",
                fullName: "y-okudera/SwiftUIApp",
                description: "Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.Swift Package based App.",
                stargazersCount: 1234,
                language: "Swift",
                htmlUrl: URL(string: "https://github.com/y-okudera/SwiftUIApp")!,
                owner: GitHubUser(
                    id: 100,
                    login: "mock",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/25205138?v=4")!,
                    htmlUrl: URL(string: "https://github.com/y-okudera")!,
                    type: "User"
                )
            ),
            .init(
                id: 2,
                name: "y-okudera",
                fullName: "y-okudera/SwiftUIApp",
                description: "Swift Package based App.",
                stargazersCount: 1234,
                language: "Swift",
                htmlUrl: URL(string: "https://github.com/y-okudera/SwiftUIApp")!,
                owner: GitHubUser(
                    id: 100,
                    login: "mock",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/25205138?v=4")!,
                    htmlUrl: URL(string: "https://github.com/y-okudera")!,
                    type: "User"
                )
            ),
            .init(
                id: 3,
                name: "y-okudera",
                fullName: "y-okudera/SwiftUIApp",
                description: "Swift Package based App.",
                stargazersCount: 1234,
                language: "Swift",
                htmlUrl: URL(string: "https://github.com/y-okudera/SwiftUIApp")!,
                owner: GitHubUser(
                    id: 100,
                    login: "mock",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/25205138?v=4")!,
                    htmlUrl: URL(string: "https://github.com/y-okudera")!,
                    type: "User"
                )
            )
        ]
        return mock
    }()
}

#if DEBUG
struct SearchRepoView_Previews: PreviewProvider {
    static var previews: some View {
        AppPreview {
            SearchRepoView(input: nil, dataSource: .mock)
        }
    }
}
#endif
