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
    
    func getSample() -> Future<Pb_SampleResponse, Error> {
        return Future<Pb_SampleResponse, Error> { promise in
            let url = URL(string: "http://localhost:2020")!
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                guard err == nil,
                    let data = data,
                    let res = res as? HTTPURLResponse,
                    res.statusCode == 200,
                    let sample = try? Pb_SampleResponse(serializedData: data) else {
                        promise(.failure(err ?? NSError()))
                    return
                }
                promise(.success(sample))
            }.resume()
        }
    }
}
