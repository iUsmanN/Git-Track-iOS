//
//  File.swift
//  gittrack
//
//  Created by Usman on 24/11/2022.
//

import Foundation
import ActivityKit

protocol LiveActivityManager {}

extension LiveActivityManager {
    
    func startLiveActivity(pr: PullRequest) {
        let attributes = PRTrackingAttributes(name: pr.name, author: pr.creator)
        let initialContentState = PRTrackingAttributes.ContentState(status: pr.status)
        
        do {
            let deliveryActivity = try Activity<PRTrackingAttributes>.request(attributes: attributes, contentState: initialContentState)
            print("Requested Live activity: \(deliveryActivity.id)")
        } catch (let error) {
            print(error)
        }
    }
    
    func stopLiveActivity() {
        Task {
            for activity in Activity<PRTrackingAttributes>.activities{
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
    
    func showAllActivities() {
        Task {
            for activity in Activity<PRTrackingAttributes>.activities {
                print("PR details: \(activity.id) -> \(activity.attributes)")
            }
        }
    }
    
    func updateLiveActivity(status: PRStatus) {
        Task {
            let updatedPRStatus = PRTrackingAttributes.ContentState(status: .review)
            for activity in Activity<PRTrackingAttributes>.activities{
                await activity.update(using: updatedPRStatus)
            }
        }
    }
}
