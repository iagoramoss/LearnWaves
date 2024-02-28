//
//  FontManager.swift
//  WWDC2024_2
//
//  Created by Iago Ramos on 23/02/24.
//

import Foundation
import SwiftUI

class FontManager {
    static let shared = FontManager()
    
    private init(){}
    
    func registerFont(name: String, withExtension: String) {
        let url = Bundle.main.url(forResource: name, withExtension: withExtension)! as CFURL
        CTFontManagerRegisterFontsForURL(url, CTFontManagerScope.process, nil)
    }
}
