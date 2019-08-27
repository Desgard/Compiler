//
//  GuaASTNode.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/27.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

final class GuaASTNode: ASTNode {

    var parent: GuaASTNode? = nil
    
    var children: [GuaASTNode] = []
    
    var nodeType: ASTNodeType? = nil
    
    var text: String?
    
    init(type: ASTNodeType, text: String) {
        self.nodeType = type
        self.text = text
    }
    
    func add(_ child: GuaASTNode) {
        children.append(child)
        child.parent = self
    }
}
