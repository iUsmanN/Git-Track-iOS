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
                                    swipeActions(pr: pr)
                                }
                        }
                    case viewModel.sections[1]:
                        ForEach(viewModel.model[1]) { pr in
                            PRCell(pullRequest: pr)
                                .swipeActions {
                                    swipeActions(pr: pr)
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
    
    @ViewBuilder func swipeActions(pr: PullRequest) -> some View {
        Button("Track") {
            stopLiveActivity()
            startLiveActivity(pr: pr)
        }
        .tint(.blue)
    }
}

struct PullRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestsView(viewModel: PullRequestsViewModel())
    }
}

extension PullRequestsView: LiveActivityManager {}
