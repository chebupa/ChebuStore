//
//  CartScreenView.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import SwiftUI

struct CartScreenView: View {
    var body: some View {
		NavigationStack {
			VStack {
				Text("Cart")
			}
			.navigationTitle("🛒 Cart")
		}
    }
}

#Preview {
    CartScreenView()
}
