//
//  ContentView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection: TabViewRouter?
	
	var body: some View {
//		AppTabView(tabViewSelection: $selection)
		
		TestSideBarView()
	}
}

#Preview {
    ContentView()
}
