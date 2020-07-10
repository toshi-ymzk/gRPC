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
    var alertMessage: String = ""
    @Published var isAlerting: Bool = false

    var cancellables: [AnyCancellable] = .init()

    func getSample(proto: Protocol) {
        switch proto {
        case .grpc:
            gRPCClient().getSample()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self?.showAlert(err.localizedDescription)
                }
            }) { [weak self] sample in
                self?.showAlert(sample.debugDescription)
            }.store(in: &cancellables)

        case .http:
            HTTPClient().getSample()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self?.showAlert(err.localizedDescription)
                }
            }) { [weak self] sample in
                self?.showAlert(sample.debugDescription)
            }.store(in: &cancellables)
        }
    }
    
    private func showAlert(_ message: String) {
        alertMessage = message
        isAlerting = true
    }
}
