//
//  ASTNode.swift
//  CompileSample
//
//  Created by Harry Duan on 2019/8/22.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

protocol ASTNode {
    
    var parent: Self? { get set }
    
    var children: [Self] { get set }
    
    var nodeType: ASTNodeType? { get set }
    
    var text: String? { get set }
    
    func add(_ child: Self)
}
