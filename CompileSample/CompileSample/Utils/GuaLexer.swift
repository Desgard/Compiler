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
    
    typealias Token = GuaToken
    
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
            token.type = .identifier
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
            newState = .intLiteral
        }

        return newState
    }
    
    func tokenize(_ code: String) -> TokenReader {
        tokens = []
        return GuaTokenReader()
    }
    
}
