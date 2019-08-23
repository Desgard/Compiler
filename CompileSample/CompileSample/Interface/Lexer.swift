//
//  Lexer.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/18.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

protocol Lexer {
    
    associatedtype TToken: Token
    associatedtype TTokenReader: TokenReader
    
    /// 临时保存token的文本
    var tokenText: String? { get set }
    /// 保存解析出来的Token
    var tokens: [TToken] { get set }
    /// 当前正在解析的Token
    var token: TToken? { get set }

    /// 是否是字母
    func isAlpha(_ ch: String) -> Bool
    /// 是否是数字
    func isDigit(_ ch: String) -> Bool
    /// 是否是空白字符
    func isBlank(_ ch: String) -> Bool
    
    /// 有限状态机进入初始状态
    func initToken(_ ch: String) -> DfaState
    
    /// 解析字符串，形成 Token
    func tokenize(_ code: String) -> TTokenReader
    
    /// dump 所有的 Token
    @discardableResult
    static func dump(_ tokenReader: TTokenReader) -> [Self.TTokenReader.TToken]
}


extension Lexer {
    
    @discardableResult
    static func dump(_ tokenReader: TTokenReader) -> [Self.TTokenReader.TToken] {
        print("text \t\t type")
        var res: [Self.TTokenReader.TToken] = []
        while let token = tokenReader.read() {
            if let text = token.text, let type = token.type {
                print("\(text) \t\t \(type)")
                res.append(token)
            }
        }
        return res
    }
}

enum DfaState {
    case initial
    
    case `if`, id_if1, id_if2, `else`, id_else1, id_else2, id_else3, id_else4, int, id_int1, id_int2, id_int3, id, gt, ge
    
    case assignment
    
    case plus, minus, star, slash
    
    case semiColon
    case leftParen
    case rightParen
    
    case intLiteral
}

extension DfaState {
    
    static var textHash: [DfaState: String] {
        get {
            return [
                DfaState.gt: ">",
                DfaState.plus: "+",
                DfaState.minus: "-",
                DfaState.star: "*",
                DfaState.slash: "/",
                DfaState.semiColon: ";",
                DfaState.leftParen: "(",
                DfaState.rightParen: ")",
                DfaState.assignment: "=",
            ]
        }
    }
    
    static var tokenTypeHash: [DfaState: TokenType] {
        get {
            return [
                DfaState.gt: TokenType.gt,
                DfaState.plus: TokenType.plus,
                DfaState.minus: TokenType.minus,
                DfaState.star: TokenType.star,
                DfaState.slash: TokenType.slash,
                DfaState.semiColon: TokenType.semiColon,
                DfaState.leftParen: TokenType.leftParen,
                DfaState.rightParen: TokenType.rightParen,
                DfaState.assignment: TokenType.assignment,
            ]
        }
    }
    
    static var rehash: [String: DfaState] {
        get {
            return Dictionary(uniqueKeysWithValues: DfaState.textHash.map { ($1, $0) })
        }
    }
    
    func toText() -> String {
        return DfaState.textHash[self] ?? ""
    }
    
    func toTokenType() -> TokenType {
        return DfaState.tokenTypeHash[self] ?? TokenType.unknown
    }

    static func toDfa(_ from: String) -> DfaState {
        return DfaState.rehash[from] ?? DfaState.initial
    }
}
