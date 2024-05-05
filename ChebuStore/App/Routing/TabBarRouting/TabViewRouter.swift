//
//  TabViewRouter.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import Foundation
import SwiftUI

// TabView Router
public enum TabViewRouter: Identifiable, Hashable, CaseIterable {
	
	// TabView screens
	case shop
	case shopMap
	case cart
	case account
	
	public var id: TabViewRouter { self }
}

// TabView Screens
extension TabViewRouter {
	
	@ViewBuilder
	public var destination: some View {
		switch self {
		case .shop:
			ItemsView()
		case .shopMap:
			ShopMapScreenView()
		case .cart:
			CartScreenView()
		case .account:
			AccountScreenView()
		}
	}
}

// TabView Labels
extension TabViewRouter {
	
	@ViewBuilder
	public var label: some View {
		switch self {
		case .shop:
			Label("Shop", systemImage: "storefront")
		case .shopMap:
			Label("Map", systemImage: "map")
		case .cart:
			Label("Cart", systemImage: "cart")
		case .account:
			Label("Account", systemImage: "person")
		}
	}
}
