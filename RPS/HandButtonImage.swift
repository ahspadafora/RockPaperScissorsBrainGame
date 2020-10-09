//
//  HandButtonImage.swift
//  RPS
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct HandButtonImage: View {
    var handImageString: String
    
    var body: some View {
        Image(handImageString)
        .renderingMode(.original)
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 1.0))
        .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.black, lineWidth: 2))
        .background(Color.white)
    }
    
}

struct HandButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        HandButtonImage(handImageString: "rock")
    }
}
