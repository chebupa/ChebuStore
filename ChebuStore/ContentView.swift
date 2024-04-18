//
//  ContentView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			NavigationStack {
				ItemsView()
					.navigationTitle("🛍️ Shop")
			}
			.tabItem {
				Label("Shop", systemImage: "storefront")
			}
		}
	}
}

#Preview {
    ContentView()
}
