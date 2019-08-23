//
//  TokenReader.swift
//  CompileSample
//
//  Created by Harry Twan on 2019/8/18.
//  Copyright © 2019 Harry Twan. All rights reserved.
//


public protocol TokenReader {
    
    associatedtype TToken: Token

    /// 返回 Token 流中下一个 Token，并从流中取出，如果流已经为空，返回 nil
    func read() -> TToken?
    
    /// 返回 Token 流中下一个 Token，但不取出，如果流为空，返回 nil
    func peek() -> TToken?
    
    /// Token 流回退一步，
    func unread()
    
    /// 获取 Token 流当前的读取位置
    func getPosition() -> Int
    
    /// 设置 Token 流当前的读取位置
    func setPosition(position: Int)
}
