//
//  SubView.swift
//  SheeKitTest
//
//  Created by Dean on 2022-02-14.
//

import SwiftUI

struct SubView: View {
    @EnvironmentObject var applicationState: ApplicationState
    
    var body: some View {
        VStack {
            Text("Sub View")
            Text(applicationState.name)
        }
        .background(.gray)
        .frame(width: 200, height: 200)
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
