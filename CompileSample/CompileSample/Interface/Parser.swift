//
//  Parser.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/24.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

protocol Parser {
    
    associatedtype TASTNode: ASTNode
    associatedtype TTokenReader: TokenReader

    /// 解析脚本
    func parse(_ script: String) -> TASTNode
    
    /// AST 的根节点，解析入口
    func prog(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 表达式语句，即表达式后面跟个分好
    func expressionStatement(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 赋值语句
    func assignmentStatement(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 整型变量声明
    func intDeclare(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 加法表达式
    func additive(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 乘法表达式
    func multiplicative(_ tokens: TTokenReader) throws -> TASTNode
    
    /// 基础表达式
    func primary(_ tokens: TTokenReader) throws -> TASTNode
    
    
}
