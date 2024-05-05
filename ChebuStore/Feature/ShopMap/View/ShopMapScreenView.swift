//
//  ShopMapScreenView.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import SwiftUI
import MapKit

struct ShopMapScreenView: View {
    var body: some View {
		NavigationStack {
			VStack {
				Map()
					.ignoresSafeArea(.all)
			}
			.navigationTitle("🗺️ Map")
			.toolbarBackground(.hidden)
		}
    }
}

#Preview {
    ShopMapScreenView()
}
