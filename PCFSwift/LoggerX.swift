//
//  LoggerX.swift
//  PCFSwift
//
//  Created by Kamal Wadhwa on 24/09/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyBeaver

class LoggerX {
    
    static let log = LoggerX()
    
    fileprivate let beaverLog = SwiftyBeaver.self
    
    fileprivate init() {
        let cloud = SBPlatformDestination(
            appID: "e1PAoQ",
            appSecret: "5zlyvzk2v3diwipzk8alszJerwabxlt2",
            encryptionKey: "f0efyNqJoaYbifginLqFacrvB3lwyHsf"
        )
        let console = ConsoleDestination()
        //        console.format = "$DHH:mm:ss$d $N.$F():$l $L: $M"
        
        let file = FileDestination()
        
        beaverLog.addDestination(cloud)
        beaverLog.addDestination(console)
        beaverLog.addDestination(file)
    }
    
    /// log something generally unimportant (lowest priority)
    func verbose(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line) {
        beaverLog.custom(level: SwiftyBeaver.Level.verbose, message: message, file: file, function: function, line: line, context: nil)
    }
    
    /// log something which help during debugging (low priority)
    func debug(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line) {
        beaverLog.custom(level: .debug, message: message, file: file, function: function, line: line, context: nil)
    }
    
    /// log something which you are really interested but which is not an issue or error (normal priority)
    func info(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line) {
        beaverLog.custom(level: .info, message: message, file: file, function: function, line: line, context: nil)
    }
    
    /// log something which may cause big trouble soon (high priority)
    func warning(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line) {
        beaverLog.custom(level: .warning, message: message, file: file, function: function, line: line, context: nil)
    }
    
    /// log something which will keep you awake at night (highest priority)
    func error(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line) {
        beaverLog.custom(level: .error, message: message, file: file, function: function, line: line, context: nil)
    }
    
    fileprivate enum Level: Int {
        case verbose = 0
        case debug = 1
        case info = 2
        case warning = 3
        case error = 4
    }
}
