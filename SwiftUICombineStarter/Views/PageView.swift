//
//  PageView.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 06/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct PageView: View {
    
    var subviews = [UIHostingController(rootView: Text("Tab1")),UIHostingController(rootView: Text("Tab2")),UIHostingController(rootView: Text("Tab3"))]
    
    var pageIndex = 0
    
    var body: some View {
        
        PageViewController(viewControllers: subviews, pageIndex: pageIndex)
        
    }
}

