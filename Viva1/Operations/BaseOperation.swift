//
//  BaseOperation.swift
//  Viva1
//
//  Created by vishwender on 2/3/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

public class BaseOperation: Operation {
    
    public override var isAsynchronous: Bool {
        get{
            return true
        }
    }
    
    private var _isExecuting: Bool = false
    public override var isExecuting:Bool {
        get { return _isExecuting }
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting  = newValue
            didChangeValue(forKey: "isExecuting")
            if _isCancelled == true {
                self.isFinished = true
            }
        }
    }
    private var _isFinished: Bool = false
    public override var isFinished: Bool {
        get { return _isFinished }
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    private var _isCancelled: Bool = false
    public override var isCancelled: Bool {
        get { return _isCancelled }
        set {
            willChangeValue(forKey: "isCancelled")
            _isCancelled = newValue
            didChangeValue(forKey: "isCancelled")
        }
    }
    
    public final override func start() {
        super.start()
        self.isExecuting = true
    }
    
    public final override func main() {
        if isCancelled {
            isExecuting = false
            isFinished = true
            return
        }
        execute()
    }
    
    public func execute() {
        assertionFailure("execute must overriden")
        finish()
    }
    
    public final func finish(errors: [NSError] = []) {
        self.isFinished = true
        self.isExecuting = false
    }
    
    public final override func cancel() {
        super.cancel()
        isCancelled = true
        if isExecuting {
            isExecuting = false
            isFinished = true
        }
    }
}

