//
//  AdSliderView.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import SwiftUI

struct AdSliderView: View {
	
	let size: CGSize
	
    var body: some View {
		TabView {
			ForEach(1..<4) { _ in
				Image("iphone14proImage")
					.resizable(resizingMode: .stretch)
					.overlay(Rectangle().foregroundStyle(.gray))
			}
		}
		.tabViewStyle(PageTabViewStyle())
		.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
		.frame(idealWidth: size.width / 2.25,
			   idealHeight: size.width / 2.00)
    }
}

//#Preview {
//    AdSliderView(size: <#T##CGSize#>)
//}
