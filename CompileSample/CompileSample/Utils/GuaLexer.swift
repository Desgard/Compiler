//
//  GuaLexer.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation
import SwifterSwift


class GuaLexer: Lexer {

    typealias TToken = GuaToken
    typealias TTokenReader = GuaTokenReader
    
    var tokenText: String?
    
    var tokens: [GuaToken] = []
    
    var token: GuaToken?
    
    func isAlpha(_ ch: String) -> Bool {
        return ch.isAlphabetic
    }
    
    func isDigit(_ ch: String) -> Bool {
        return ch.isDigits
    }
    
    func isBlank(_ ch: String) -> Bool {
        return ch.isWhitespace
    }
    
    @discardableResult
    func initToken(_ ch: String) -> DfaState {

        guard let tokenText = tokenText, let token = token else {
            return .initial
        }
        
        if tokenText.count > 0 {
            token.text = tokenText
            tokens.append(token)
            
            self.tokenText = ""
            self.token = GuaToken()
        }
        
        var newState: DfaState = .initial
        if isAlpha(ch) {
            if ch == "i" {
                newState = .id_int1
            } else {
                newState = .id
            }
            self.token!.type = .identifier
            self.tokenText! += ch
        }
        else if isDigit(ch) {
            newState = .intLiteral
            self.token!.type = .intLiteral
            self.tokenText! += ch
        }
        else if ch == DfaState.toDfa(ch).toText() {
            newState = DfaState.toDfa(ch)
            self.token!.type = DfaState.toDfa(ch).toTokenType()
            self.tokenText! += ch
        }
        else {
            newState = .initial
        }
        
        

        return newState
    }
    
    /// 解析字符串，形成 Token
    func tokenize(_ code: String) -> GuaTokenReader {
        tokens = []
        self.token = GuaToken()
        var state = DfaState.initial
        var ch = ""
        tokenText = ""
        for ich in 0 ..< code.count {
            let index: String.Index = code.index(code.startIndex, offsetBy: ich)
            ch = String(code[index])
            switch state {
                
            case .initial:
                state = initToken(ch)
                continue
                
            case .id:
                if isAlpha(ch) || isDigit(ch) {
                    tokenText?.append(ch)
                } else {
                    state = initToken(ch)
                }
                
            case .gt:
                if ch == "=" {
                    self.token!.type = .ge
                    state = .ge
                    tokenText?.append(ch)
                } else {
                    state = initToken(ch)
                }
                
            case .ge, .assignment, .plus, .minus, .star, .slash, .semiColon, .leftParen, .rightParen:
                state = initToken(ch)
                
            case .intLiteral:
                if isDigit(ch) {
                    tokenText?.append(ch)
                } else {
                    state = initToken(ch)
                }
                
            case .id_int1:
                if ch == "n" {
                    state = .id_int2
                    tokenText?.append(ch)
                }
                else if isDigit(ch) || isAlpha(ch) {
                    state = .id
                    tokenText?.append(ch)
                }
                else {
                    state = initToken(ch)
                }
                
            case .id_int2:
                if ch == "t" {
                    state = .id_int3
                    tokenText?.append(ch)
                }
                else if isDigit(ch) || isAlpha(ch) {
                    state = .id
                    tokenText?.append(ch)
                }
                else {
                    state = initToken(ch)
                }
                
            case .id_int3:
                if isBlank(ch) {
                    token?.type = .int
                    state = initToken(ch)
                } else {
                    state = .id
                    tokenText?.append(ch)
                }
                
            default:
                break
            }
        }
        
        if let tokenText = tokenText, tokenText.count > 0 {
            initToken(ch)
        }
        
        return GuaTokenReader(tokens: tokens)
    }
    
}
