//
//  ContentViewModel.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import Foundation
import Combine

enum Protocol {
    case grpc
    case http
}

final class ContentViewModel: ObservableObject {
    
    var sample: Pb_SampleResponse = .init()
    @Published var showingAlert: Bool = false

    var cancellables: [AnyCancellable] = .init()

    func getSample(proto: Protocol) {
        switch proto {
        case .grpc:
            gRPCClient().getSample()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            }) { sample in
                self.sample = sample
                self.showingAlert = true
            }.store(in: &cancellables)

        case .http:
            HTTPClient().getSample()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            }) { sample in
                self.sample = sample
                self.showingAlert = true
            }.store(in: &cancellables)
        }
    }
}
