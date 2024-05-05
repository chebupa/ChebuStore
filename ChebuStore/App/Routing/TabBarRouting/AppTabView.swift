//
//  AppTabView.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import SwiftUI

struct AppTabView: View {
	
	@Binding var tabViewSelection: TabViewRouter?
	
    var body: some View {
		TabView(selection: $tabViewSelection) {
			ForEach(TabViewRouter.allCases) { screen in
				screen.destination
					.tag( screen as TabViewRouter )
					.tabItem { screen.label }
			}
		}
    }
}
