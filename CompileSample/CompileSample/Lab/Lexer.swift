//
//  Lexer.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/18.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

protocol Lexer {
    func isAlpha(_ ch: Int)
    func isDigit(_ ch: Int)
    func isBlank(_ ch: Int)
}
