//
//  ItemsViewModel.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable
public final class ItemsViewModel {
	
	let columns: [GridItem]
	var searchText: String
	var qrScannerIsShown: Bool
	var navPath: NavigationPath
	
	init(columns: [GridItem] = [GridItem(), GridItem()], searchText: String = "", qrScannerIsShown: Bool = false, navPath: NavigationPath = NavigationPath()) {
		self.columns = columns
		self.searchText = searchText
		self.qrScannerIsShown = qrScannerIsShown
		self.navPath = navPath
	}
}
