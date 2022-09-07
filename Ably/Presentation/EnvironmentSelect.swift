//
//  EnvironmentSelect.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import SwiftUI

struct EnvironmentSelect: View {
    @State var scheme: DIEnvironment.Scheme? = nil
    var delegate: EnvironmentSelectDelegate?
    
    var body: some View {
        Text("mock real 선택하는 화면")
            .onAppear {
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 2.0,
                    execute: {
                        scheme = .mock
                        delegate?.onSelected(scheme: scheme!)
                    }
                )
            }
    }
}

protocol EnvironmentSelectDelegate {
    func onSelected(scheme: DIEnvironment.Scheme)
}

struct EnvironmentSelect_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSelect()
    }
}
