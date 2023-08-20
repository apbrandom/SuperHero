//
//  InfoDetailsRow.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 08.08.2023.
//

import SwiftUI

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(title: "Stranght", value: "00")
    }
}
