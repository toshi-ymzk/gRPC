//
//  gRPCClient.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Foundation
import Combine

class gRPCClient: Client {
    
    func getSample() -> AnyPublisher<Pb_SampleResponse, Error> {
        return Future<Pb_SampleResponse, Error> { promise in
            let client = Pb_SampleServiceServiceClient(address: "127.0.0.1:2021", secure: false)
            let req = Pb_SampleRequest()
            do {
                let sample = try client.getSample(req)
                promise(.success(sample))
            } catch let err {
                promise(.failure(err))
            }
        }.eraseToAnyPublisher()
    }
}
