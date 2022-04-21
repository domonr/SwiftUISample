//
//  AnimateButtonStyle.swift
//  
//
//  Created by Domon on 2022/04/21.
//

import SwiftUI

struct AnimateButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        
        return configuration
            .label
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.1), value: isPressed)
    }
}
