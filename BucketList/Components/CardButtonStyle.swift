//
//  CardButtonStyle.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//
import SwiftUI

/// Card button style that gives a filled round Rectangle button
class CardButtonStyle<Background: View>: ButtonStyle {
    
    // MARK: Properties
    
    let background: Background
    
    // MARK: Init
    
    init(@ViewBuilder background: () -> Background) {
        self.background = background()
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(background)
            .cornerRadius(12.0)
            .shadow(color: Color(hue: 0.0, saturation: 0.0, brightness: 0.0, opacity: 0.125), radius: 8, x: 0.0, y: 0.0)
            .overlay(
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                    .stroke(Color(.separator), lineWidth: 1)
                    .opacity(0.2)
            )
            .padding(.vertical, 8.0)
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .animation(.spring())
    }
}

class StandardCardButtonStyle: CardButtonStyle<Color> {
    
    init() {
        super.init(background: { Color.blue })
    }
}
