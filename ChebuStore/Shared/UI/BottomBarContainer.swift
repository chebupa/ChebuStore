//
//  BottomBarContainer.swift
//  ChebuStore
//
//  Created by aristarh on 15.05.2024.
//

import SwiftUI

struct BottomBarContainer<MainContent: View, BottomContent: View>: View {
	
	public var mainContent: MainContent
	public var bottomContent: BottomContent
	
//	public init(@ViewBuilder mainContent: @escaping () -> MainContent, @ViewBuilder bottomContent: @escaping () -> BottomContent) {
//		self.mainContent = mainContent()
//		self.bottomContent = bottomContent()
//	}
	
	var body: some View {
		VStack {
			mainContent
			
			Spacer()
			
			bottomContent
		}
	}
}
