//
//  ContentView.swift
//  gRPC
//
//  Created by Toshihiro Yamazaki on 2020/07/08.
//  Copyright © 2020 Toshihiro Yamazaki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: ContentViewModel = .init()
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            Button(action: {
                self.vm.getSample(proto: .grpc)
            }) {
                Text("gRPC").font(.headline)
            }.alert(isPresented: $vm.showingAlert) {
                Alert(title: Text("Success: \(vm.sample.name)"))
            }
            Button(action: {
                self.vm.getSample(proto: .http)
            }) {
                Text("HTTP").font(.headline)
            }.alert(isPresented: $vm.showingAlert) {
                Alert(title: Text("Success: \(vm.sample.name)"))
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
