//
//  NavigationRouter.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

protocol NavigationRouter: Hashable {
    associatedtype Content: View
    
    @ViewBuilder
    func view() -> Content
}
