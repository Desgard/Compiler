//
//  GuaParser.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

public class GuaParser: Parser {
    
    typealias TASTNode = GuaASTNode
    
    typealias TTokenReader = GuaTokenReader
    
    func parse(_ script: String) -> GuaASTNode {
        let lexer = GuaLexer()
        let tokens = lexer.tokenize(script)
        do {
            let rootNode = try prog(tokens)
            return rootNode
        }
        catch let error {
            fatalError("解析入口报错, \(error.localizedDescription)")
        }
    }
    
    func prog(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func expressionStatement(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func assignmentStatement(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func intDeclare(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func additive(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func multiplicative(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
    
    func primary(_ tokens: GuaTokenReader) throws -> GuaASTNode {
        <#code#>
    }
}
