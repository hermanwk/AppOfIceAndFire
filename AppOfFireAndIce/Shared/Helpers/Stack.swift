//
//  Stack.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        if (items.count > 1) {
            return items.removeLast()
        }
        return items.last!
    }
    
    mutating func current() -> Element? {
        return items.last
    }
}
