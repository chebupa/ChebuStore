//
//  TestSideBarView.swift
//  ChebuStore
//
//  Created by aristarh on 26.05.2024.
//

import SwiftUI

struct TestSideBarView: View {
	
	@State private var navPath: NavigationPath = NavigationPath()
	
    var body: some View {
		SideBarView(position: .left, color: .lightgray, sideContent: SideContentView()) {
			NavigationStack(path: $navPath) {
				VStack {
					Text("asd")
				}
			}
//			ItemsView()
		}
    }
	
	@ViewBuilder
	private func SideContentView() -> some View {
		VStack(spacing: 1) {
			ForEach(SideBarTabs.allCases) { tab in
//				Button(tab.rawValue, systemImage: tab.imageName) {
//					navPath = NavigationPath()
////					navPath.append(<#T##value: Hashable##Hashable#>)
//				}
				NavigationLink {
					tab.view
				} label: {
					Label(tab.rawValue, systemImage: tab.imageName)
				}
				.frame(maxWidth: .infinity, maxHeight: 30)
				.bold()
			}
		}
	}
}

#Preview {
    TestSideBarView()
}

// MARK: - asd
// Tabs
public enum SideBarTabs: String, Hashable, Identifiable, CaseIterable {
	
	case home = "Home"
	case map = "Map"
	case cart = "Cart"
	
	public var id: SideBarTabs { self }
}

// Images
extension SideBarTabs {
	
	public var imageName: String {
		switch self {
		case .home:
			"house"
		case .map:
			"map"
		case .cart:
			"cart"
		}
	}
}

// Views
extension SideBarTabs {
	
	@ViewBuilder
	public var view: some View {
		switch self {
		case .home:
			HomeView()
		case .map:
			MapView()
		case .cart:
			CartView()
		}
	}
}

// MARK: - Test TabViews

struct HomeView: View {
	var body: some View {
		NavigationStack {
			VStack {
				Text("home")
			}
		}
	}
}

struct MapView: View {
	var body: some View {
		NavigationStack {
			VStack {
				Text("map")
			}
		}
	}
}

struct CartView: View {
	var body: some View {
		NavigationStack {
			VStack {
				Text("cart")
			}
		}
	}
}
