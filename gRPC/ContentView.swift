//
//  ContentView.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let vm: ContentViewModel = .init()
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            Button(action: {
                self.vm.getSample(proto: .grpc)
            }) {
                Text("gRPC").font(.headline)
            }
            Button(action: {
                self.vm.getSample(proto: .http)
            }) {
                Text("HTTP").font(.headline)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
