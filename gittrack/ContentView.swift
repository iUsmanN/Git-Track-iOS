//
//  ContentView.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import SwiftUI

//struct ContentView: View {
//    let items: [Bookmark] = [.example1, .example2, .example3]
//
//    var body: some View {
//        List(items, children: \.items) { row in
//            Image(systemName: row.icon)
//            Text(row.name)
//        }
//    }
//}

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            PullRequestsView(viewModel: PullRequestsViewModel())
//                .navigationTitle("Pull Requests")
//        }
        LoginView()
//        PullRequestsView(viewModel: PullRequestsViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
