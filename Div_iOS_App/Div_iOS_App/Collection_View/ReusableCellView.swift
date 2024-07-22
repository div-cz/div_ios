//
//  ReusableCellView.swift
//  Div_iOS_App
//
//  Created by Christián on 22/07/2024.
//

import SwiftUI

struct ReusableCellView: View {
    var body: some View {
        Text("Testing UI Cell")
        Circle()
            .stroke(.black, lineWidth: 10)
            .fill(.red)
            .frame(height: 100)
    }
}

#Preview {
    ReusableCellView()
}
