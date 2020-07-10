//
//  HTTPClient.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Foundation
import Combine

class HTTPClient: Client {
    
    func getSample() -> AnyPublisher<Pb_SampleResponse, Error> {
        let url = URL(string: "http://localhost:2020")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, res) -> Pb_SampleResponse in
            try Pb_SampleResponse(serializedData: data)
        }.eraseToAnyPublisher()
    }
}
