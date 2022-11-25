//
//  GlowingCircle.swift
//  gittrack
//
//  Created by Usman on 24/11/2022.
//

import SwiftUI

struct GlowingCircle: View {
    
    private var glowing: Bool
    private var status: PRStatus
    private var maxRadius: CGFloat
    
    init(glowing: Bool, status: PRStatus, maxRadius: CGFloat) {
        self.glowing = glowing
        self.status = status
        self.maxRadius = maxRadius
    }
    
    var body: some View {
        Circle()
            .frame(width: glowing ? maxRadius : 10)
            .foregroundColor(glowing ? getColor() : .gray)
            .shadow(color: getColor(), radius: glowing ? 10 : 0)
    }
    
    func getColor() -> Color {
        switch status {
        case .draft:
            return .gray
        case .review:
            return .purple
        case .blocked:
            return .red
        case .attention:
            return .green
        }
    }
}

struct GlowingCircle_Previews: PreviewProvider {
    static var previews: some View {
        GlowingCircle(glowing: true, status: .attention, maxRadius: 20)
        GlowingCircle(glowing: false, status: .draft, maxRadius: 20)
    }
}
