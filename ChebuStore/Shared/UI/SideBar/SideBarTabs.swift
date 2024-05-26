//
//  SideBarTabs.swift
//  ChebuStore
//
//  Created by aristarh on 26.05.2024.
//

import Foundation
import SwiftUI

// SideBar Tabs
public enum SideBarTabSelection: String, Hashable, Identifiable, CaseIterable {
	
	case first
	case second
	case third
	
	public var id: SideBarTabSelection { self }
}

// SideBar Tab's images
extension SideBarTabSelection {
	
	public var imageName: String {
		switch self {
		case .first:
			"house"
		case .second:
			"leaf"
		case .third:
			"person"
		}
	}
}

// SideBar MainContent View
extension SideBarTabSelection {
	
	@ViewBuilder
	public var mainView: some View {
		switch self {
		case .first:
			VStack {}
		case .second:
			VStack {}
		case .third:
			VStack {}
		}
	}
}
