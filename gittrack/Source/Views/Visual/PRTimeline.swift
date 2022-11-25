//
//  PRTimeline.swift
//  gittrack
//
//  Created by Usman on 24/11/2022.
//

import SwiftUI

struct PRTimeline: View {
    
    @State var status: PRStatus
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                SimpleLine()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [1]))
                    .foregroundColor(.gray)
                HStack {
                    GlowingCircle(glowing: status == .draft, status: .draft, maxRadius: 20)
                    Spacer()
                    GlowingCircle(glowing: status == .blocked, status: .blocked, maxRadius: 20)
                    Spacer()
                    GlowingCircle(glowing: status == .review, status: .review, maxRadius: 20)
                    Spacer()
                    GlowingCircle(glowing: status == .attention, status: .attention, maxRadius: 20)
                }
            }
            Text(status.rawValue)
                .font(.caption2)
                .padding(.bottom, 5)
                .foregroundColor(.white)
        }
    }
}

struct SimpleLine : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to:CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}



struct PRTimeline_Previews: PreviewProvider {
    static var previews: some View {
        PRTimeline(status: .draft)
            .previewLayout(.fixed(width: 150, height: 60))
        PRTimeline(status: .review)
            .previewLayout(.fixed(width: 150, height: 60))
        PRTimeline(status: .blocked)
            .previewLayout(.fixed(width: 150, height: 60))
        PRTimeline(status: .attention)
            .previewLayout(.fixed(width: 150, height: 60))
    }
}
