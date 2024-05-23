//
//  CustomViewDidLoad.swift
//  ChebuStore
//
//  Created by aristarh on 15.05.2024.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
	
	@State private var didLoad = false
	
	private let action: (() -> Void)?
	
	init(perform action: (() -> Void)? = nil) {
		self.action = action
	}
	
	func body(content: Content) -> some View {
		content.onAppear {
			if didLoad == false {
				didLoad = true
				action?()
			}
		}
	}
	
}

extension View {
	
	func onLoad(perform action: (() -> Void)? = nil) -> some View {
		modifier(ViewDidLoadModifier(perform: action))
	}
	
}
