//
//  PRStatus.swift
//  gittrack
//
//  Created by Usman on 23/11/2022.
//

import SwiftUI

struct PRIcon: View {
    
    @State private var state: PRStatus
    
    init(state: PRStatus) {
        self.state = state
    }
    
    var body: some View {
        ZStack {
            switch state {
            case .draft:
                ApprovedIcon()
                    .stroke()
                    .foregroundColor(.gray)
                    .opacity(0.7)
                Circle()
                    .frame(width: 26)
                    .foregroundColor(.gray)
                    .opacity(0.5)
            case .review:
                ReviewIcon()
                    .stroke()
                    .foregroundColor(.purple)
                    .opacity(0.5)
                Circle()
                    .frame(width: 22)
                    .foregroundColor(.purple)
            case .blocked:
                ApprovedIcon()
                    .stroke()
                    .foregroundColor(.red)
                    .opacity(0.5)
                Circle()
                    .frame(width: 17)
                    .foregroundColor(.red)
            case .attention:
                ApprovedIcon()
                    .stroke()
                    .foregroundColor(.green)
                    .opacity(0.5)
                Circle()
                    .frame(width: 26)
                    .foregroundColor(.green)
            }
        }
        .frame(width: 50, height: 50)
    }
    
    @ViewBuilder func approvedIcon() -> some View {
        Text("A")
    }
}

struct ApprovedIcon : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 15, startAngle: .degrees(-90), endAngle: .degrees(280), clockwise: false)
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY*0.8))
        return path
    }
}

struct ReviewIcon : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 15, startAngle: .degrees(-90), endAngle: .degrees(280), clockwise: false)
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY*0.8))
        return path
    }
}

struct PRIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PRIcon(state: .draft)
            PRIcon(state: .review)
            PRIcon(state: .blocked)
            PRIcon(state: .attention)
        }
        .previewLayout(.fixed(width: 50, height: 300))
    }
}
