//
//  ASTNodeType.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

public enum ASTNodeType {
    /// 程序入口，根节点
    case program
    
    /// 整型变量声明
    case intDeclaration
    /// 表达式语句，即表达式后面跟个分号
    case expressionStmt
    /// 赋值语句
    case assignmentStmt
    
    /// 基础表达式
    case primary
    /// 乘法表达式
    case mutiplicative
    /// 加分表达式
    case additive
    
    /// 标识符
    case identifier
    /// d整型字面量
    case intLiteral
}
