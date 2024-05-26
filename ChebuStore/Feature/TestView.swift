//
//  TestView.swift
//  ChebuStore
//
//  Created by aristarh on 25.05.2024.
//

import SwiftUI

struct TestView: View {
    var body: some View {
		ScrollViewReader { scroll in
			VStack {
				Rectangle()
					.frame(height: scroll.)
				
				List {
					Text("asd")
					Text("asd")
					Text("asd")
				}
			}
		}
    }
}

#Preview {
    TestView()
}
