//
//  TokenType.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

public enum TokenType {
    case unknown
    /// +
    case plus
    /// -
    case minus
    /// *
    case star
    /// /
    case slash
    
    /// >=
    case ge
    /// >
    case gt
    /// ==
    case eq
    /// <=
    case le
    /// <
    case lt
    
    /// ;
    case semiColon
    /// (
    case leftParen
    /// )
    case rightParen
    /// =
    case assignment
    
    case `if`
    case `else`
    
    case int
    /// 标识符
    case identifier
    /// 整型字面量
    case intLiteral
    /// 字符串字面量
    case stringLiteral
}
