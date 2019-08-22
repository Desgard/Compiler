//
//  main.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/18.
//  Copyright © 2019 Harry Twan. All rights reserved.
//

import Foundation

print("Hello, World!")


let lexer: GuaLexer = GuaLexer()
let script: String = "int age = 45;"
let tokenReader = lexer.tokenize(script)

GuaLexer.dump(tokenReader)

