//
//  gRPCClient.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Foundation

class gRPCClient: Client {
    
    func getSample() {
        let client = Pb_SampleServiceServiceClient(address: "127.0.0.1:2021", secure: false)
        let req = Pb_SampleRequest()
        guard let sample = try? client.getSample(req) else {
            return
        }
    }
}
