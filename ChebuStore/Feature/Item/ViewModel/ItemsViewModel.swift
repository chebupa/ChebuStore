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
	
	private let decoder = JSONDecoder()
	
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
	
	private enum ItemsViewModelErrors: Error {
		
		case decodingFailed
	}
	
	internal func getItems() throws -> [ItemModel] {
		
		guard let sourceURL = Bundle.main.url(forResource: "itemsMockData", withExtension: "json") else {
			throw ItemsViewModelErrors.decodingFailed
		}
		
		guard let itemsData = try? Data(contentsOf: sourceURL) else {
			throw ItemsViewModelErrors.decodingFailed
		}
		
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		guard let data = try? decoder.decode(ItemsMockDataModel.self, from: itemsData) else {
			throw ItemsViewModelErrors.decodingFailed
		}
		
		print(data.items)
		return data.items
	}
}
