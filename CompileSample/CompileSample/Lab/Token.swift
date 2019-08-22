//
//  Token.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/18.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

public protocol Token {
    var text: String? { get set }
    var type: TokenType? { get set }
}
