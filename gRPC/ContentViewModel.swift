//
//  ContentViewModel.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Foundation

enum Protocol {
    case grpc
    case http
}

final class ContentViewModel {
    
    func getSample(proto: Protocol) {
        switch proto {
        case .grpc:
            break
        case .http:
            break
        }
    }
}
