//
//  GoodbyeSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 22/08/2016.
//
//

import Foundation
import SwiftyJSON

/// [GOODBYE, details|dict, reason|uri]
class GoodbyeSwampMessage: SwampMessage {

    let type: SwampMessageType = .goodbye
    let details: [String: Any]
    let reason: String

    init(details: [String: Any], reason: String) {
        self.details = details
        self.reason = reason
    }

    // MARK: SwampMessage protocol

    required init(payload: [Any]) {
        self.details = payload[0] as! [String: Any]
        self.reason = payload[1] as! String
    }

    func marshal() -> [Any] {
        return [self.type.rawValue, self.details, self.reason]
    }
}
