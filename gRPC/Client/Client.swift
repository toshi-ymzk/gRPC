//
//  Client.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Combine

protocol Client {
    func getSample() -> AnyPublisher<Pb_SampleResponse, Error>
}
