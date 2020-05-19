//
//  ListItem.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation


struct ListItem: Identifiable {
    
    var id = UUID()
    var title: String
    var subTitle: String
    var image: String
    
    init(title: String, subTitle: String, image: String) {
        
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}
