//
//  GenericStack.swift
//  Articles_SwiftUI
//
//  Created by Mandar Kadam on 17/03/24.
//

import Foundation

struct GenericStack<Element> {
    
    var items = [Element]()
    
    mutating func pop() -> Element? {
        if isEmpty() {
            return nil
        }
        return items.removeLast()
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}
