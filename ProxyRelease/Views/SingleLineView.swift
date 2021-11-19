//
//  SingleLineView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation
import SwiftUI

struct SingleLineView: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
        }
    }
}
