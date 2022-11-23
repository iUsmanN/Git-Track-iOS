//
//  PullRequestsView.swift
//  gittrack
//
//  Created by Usman on 23/11/2022.
//

import SwiftUI

struct PullRequestsView: View {
    
    @ObservedObject var viewModel: PullRequestsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.sections, id: \.self) { section in
                Section(section) {
                    switch section {
                    case viewModel.sections[0]:
                        ForEach(viewModel.model[0]) { pr in
                            PRCell(pullRequest: pr)
                                .swipeActions {
                                    Button("Track") {
                                        print("Start live activity")
                                    }
                                    .tint(.blue)
                                    
                                    Button("Star") {
                                        print("Star PR")
                                    }
                                    .tint(.yellow)
                                }
                        }
                    case viewModel.sections[1]:
                        ForEach(viewModel.model[1]) { pr in
                            PRCell(pullRequest: pr)
                                .swipeActions {
                                    swipeActions()
                                }
                        }
                    case viewModel.sections[2]:
                        ForEach(viewModel.model[2]) { pr in
                            PRCell(pullRequest: pr)
                        }
                    default:
                        Text("Default")
                    }
                }
            }
            .onAppear {
                self.viewModel.loadPRs()
            }
            .navigationTitle("Pull Requests")
        }
    }
    
    @ViewBuilder func swipeActions() -> some View {
        Button("Track") {
            print("Start live activity")
        }
        .tint(.blue)
        
        Button("Star") {
            print("Star PR")
        }
        .tint(.yellow)
    }
}

struct PullRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestsView(viewModel: PullRequestsViewModel())
    }
}
