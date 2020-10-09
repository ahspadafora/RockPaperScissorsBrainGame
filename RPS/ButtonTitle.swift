//
//  ButtonTitle.swift
//  RPS
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ButtonTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.title)
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 3))
    }
}

extension View {
    func whiteButtonStyle() -> some View {
        self.modifier(ButtonTitle())
    }
}

