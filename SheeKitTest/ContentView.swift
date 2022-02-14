//
//  ContentView.swift
//  SheeKitTest
//
//  Created by Dean on 2022-02-14.
//

import SwiftUI
import SheeKit

struct ContentView: View {
    
    @StateObject private var applicationState = ApplicationState()
    @State private var presentSheet: Bool = false
    @State private var presetShee: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text(applicationState.name)
                Button("Show sheet") {
                    presentSheet.toggle()
                }
                Button("Show shee") {
                    presetShee.toggle()
                }
            }
            .sheet(isPresented: $presentSheet, content: {
                SubView()
            })
            .shee(
                isPresented:$presetShee,
                presentationStyle: .formSheet(properties: .init(detents: [ .large(), .large() ], animatesSelectedDetentIdentifierChange: true)),
                presentedViewControllerParameters: presentedViewControllerParameters) {
                    SubView()
                }
                
        }
        .environmentObject(applicationState)
    }
}

var presentedViewControllerParameters: UIViewControllerProxy {
        var parameters = UIViewControllerProxy()
        parameters.preferredStatusBarStyle = .darkContent
        parameters.preferredStatusBarUpdateAnimation = .fade
        parameters.isModalInPresentation = true
        parameters.modalTransitionStyle = .coverVertical
        parameters.preferredContentSize = CGSize(width: 1200, height: 1200)
        return parameters
    }

var presentationStyle: ModalPresentationStyle {
    var sheetProperties = SheetProperties()
    sheetProperties.detents =  [ .large(), .large() ]
    return .formSheet(properties: sheetProperties)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
