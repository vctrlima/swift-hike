//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Victor Lima on 11/01/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var isAnimating: Bool = false
    @State private var randomCircle: Int = Int.random(in: 6...12)
    
    private func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 4.0...80.0)
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.25...2.0)
    }
    
    private func randomSpeed() -> Double {
        return Double.random(in: 0.25...1.0)
    }
    
    private func randomDelay() -> Double {
        return Double.random(in: 0.0...2.0)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {
        MotionAnimationView()
            .background(Circle().fill(.teal))
    }
}
