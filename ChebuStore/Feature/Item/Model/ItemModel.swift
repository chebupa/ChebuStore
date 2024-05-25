//
//  Item.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import Foundation

struct ItemsMockDataModel: Decodable {
	
	let items: [ItemModel]
}

struct ItemModel: Decodable, Hashable, Identifiable {
	
	let id: Int
	
	let itemName: String
	let itemPrice: Int
	let itemImage: String
}
