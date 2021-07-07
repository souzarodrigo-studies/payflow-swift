//
//  ContentView.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 04/07/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Inject var dependency: MyDependency
    
    var body: some View {
        VStack {
            Text("Abestadu")
                .padding()
            Button("Tap Me", action: dependency.doSomething)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
