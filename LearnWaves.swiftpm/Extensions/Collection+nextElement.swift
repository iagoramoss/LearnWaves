//
//  Collection+nextElement.swift
//  teste
//
//  Created by Iago Ramos on 17/02/24.
//

import Foundation

extension Collection where Element: Identifiable {
    func nextElement(after element: Element) -> Element? {
        guard let index = self.firstIndex(where: { $0.id == element.id }) else { return nil }
        
        let nextIndex = self.index(after: index)
        return self.indices.contains(nextIndex) ? self[nextIndex] : nil
    }
}
