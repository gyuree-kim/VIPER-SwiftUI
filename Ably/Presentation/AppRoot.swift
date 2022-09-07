//
//  AppRoot.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import SwiftUI

struct AppRoot: View {
    @Environment(\.container) var container: DIContainer
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AppRoot_Previews: PreviewProvider {
    static var previews: some View {
        AppRoot()
    }
}
