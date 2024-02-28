//
//  WaveSlider.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct WaveSlider: View {
    let propertyName: String
    var unit: String = ""
    
    @Binding var value: Float
    let isHidden: Bool
    
    var min: Float = 0
    var max: Float = 1000
    
    @State private var enabledValue: Float? = nil
    
    var body: some View {
        if !isHidden {
            VStack(alignment: .leading) {
                Text("\(propertyName.capitalized): \(value, specifier: "%.1f")\(unit)")
                
                Slider(value: $value, in: min...max)
                    .padding(.top, -10)
            }
        }
    }
}
