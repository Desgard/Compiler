//
//  ASTNode.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

protocol ASTNode {
    /// 父节点
    func getParent() -> ASTNode
    
    /// 子节点
    func getChildren() -> [ASTNode]
    
    ///  AST 类型
    func getType() -> ASTNodeType
    
    /// 文本值
    func getText() -> String
}
