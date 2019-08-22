//
//  GuaTokenReader.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

class GuaTokenReader: TokenReader {
    
    var tokens: [Token]
    var pos: Int = 0
    
    init(tokens: [Token] = []) {
        self.tokens = tokens
    }
    
    func read() -> Token? {
        if pos < tokens.count {
            pos += 1
            return tokens[pos - 1]
        }
        return nil
    }
    
    func peek() -> Token? {
        if pos < tokens.count {
            return tokens[pos]
        }
        return nil
    }
    
    func unread() {
        if pos > 0 {
            pos -= 1
        }
    }
    
    func getPosition() -> Int {
        return pos
    }
    
    func setPosition(position: Int) {
        if position >= 0 && position < tokens.count {
            pos = position
        }
    }
    
    
}
