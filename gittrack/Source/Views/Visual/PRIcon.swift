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
        GeometryReader { geometry in
            ZStack {
                switch state {
                case .draft:
                    ApprovedIcon()
                        .stroke()
                        .foregroundColor(.gray)
                        .opacity(0.7)
                    Circle()
                        .frame(width: geometry.size.width * 0.45)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                case .review:
                    ApprovedIcon()
                        .stroke()
                        .foregroundColor(.purple)
                        .opacity(0.5)
                    Circle()
                        .frame(width: geometry.size.width * 0.45)
                        .foregroundColor(.purple)
                case .blocked:
                    ApprovedIcon()
                        .stroke()
                        .foregroundColor(.red)
                        .opacity(0.5)
                    Circle()
                        .frame(width: geometry.size.width * 0.4)
                        .foregroundColor(.red)
                case .attention:
                    ApprovedIcon()
                        .stroke()
                        .foregroundColor(.green)
                        .opacity(0.5)
                    Circle()
                        .frame(width: geometry.size.width * 0.55)
                        .foregroundColor(.green)
                }
            }
        }
    }
    
    @ViewBuilder func approvedIcon() -> some View {
        Text("A")
    }
}

struct ApprovedIcon : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.maxY*0.3, startAngle: .degrees(-90), endAngle: .degrees(280), clockwise: false)
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY*0.8))
        return path
    }
}

struct PRIcon_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PRIcon(state: .draft)
                .frame(width: 50, height: 50)
            PRIcon(state: .review)
                .frame(width: 40, height: 40)
            PRIcon(state: .blocked)
                .frame(width: 30, height: 30)
            PRIcon(state: .attention)
                .frame(width: 20, height: 20)
        }
        .previewLayout(.fixed(width: 50, height: 300))
    }
}
