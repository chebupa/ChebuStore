//
//  AnotherSideBarView.swift
//  ChebuStore
//
//  Created by aristarh on 26.05.2024.
//

import SwiftUI

// Helpers
public enum SideBarPosition {
	case left
	case right
}

// View
struct SideBarView<SideContent: View, MainContent: View>: View {
	
	public var position: SideBarPosition
	public var color: Color
	public var blur: Bool?
	public var threeDEffect: Bool?
	public var sideContent: SideContent
	@ViewBuilder public var mainContent: () -> MainContent
	
	@State private var mainContentOffsetX: CGFloat = 0
	private let openedSidebarOffset: CGFloat = UIScreen.screenWidth * 0.6
	
	var body: some View {
		ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
			Rectangle()
				.frame(maxWidth: 235,
					   maxHeight: .infinity,
					   alignment: position == .left ? .leading : .trailing)
				.background(color)
				.foregroundStyle(color)
				.overlay {
					sideContent
						.rotation3DEffect(threeDEffect != nil ?
							.degrees(mainContentOffsetX / 14) :
							.degrees(0), axis: (x: 0, y: 0, z: 0))
						// .scaleEffect(x: mainContentOffsetX / 200, y: mainContentOffsetX / 200)
				}
			
			mainContent()
				.zIndex(1)
				.blur(radius: mainContentOffsetX >= 235 && blur != nil ? 5 : 0)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.offset(x: position == .left ? mainContentOffsetX : -mainContentOffsetX)
				// .allowsHitTesting(mainContentOffsetX >= 235 ? false : true)
				.onTapGesture {
					withAnimation(.smooth) {
						mainContentOffsetX = 0
					}
				}
				.gesture(
					DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
						.onChanged({ value in
							
							// left
							if value.translation.width < 10 {
								withAnimation(.smooth) {
									mainContentOffsetX = position == .left ? 0 : openedSidebarOffset
								}
							}
							
							// right
							if value.translation.width > 50 {
								withAnimation(.smooth) {
									mainContentOffsetX = position == .left ? openedSidebarOffset : 0
								}
							}
						})
						.onEnded({ value in })
				)
		}
		.background(color)
	}
}

#Preview {
	SideBarView(position: .left, color: .blue, blur: true, sideContent: Text("test")) {
		TabView {
			ItemsView()
		}
	}
}
