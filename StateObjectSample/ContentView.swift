//
//  ParentView.swift
//  StateObjectSample
//
//  Created by hajime-nakamura on 2020/07/20.
//

import SwiftUI

class Store: ObservableObject {
    @Published var count = 0
}

struct ParentView: View {
    @State var count = 0

    var body: some View {
        VStack {
            Text("ParentView count \(count)")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Button("ParentView increment count") {
                count += 1
            }
            .foregroundColor(.white)
            ChildView()
                .padding()
        }
        .padding()
        .background(Color.pink)
    }
}

struct ChildView: View {
//    @ObservedObject var store = Store() // ParentView の count が更新されると初期化されてしまう
    @StateObject var store = Store()

    var body: some View {
        VStack {
            Text("ChildView store count \(store.count)")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Button("ChildView increment store count") {
                store.count += 1
            }
            .foregroundColor(.white)
        }
        .padding()
        .background(Color.green)
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
