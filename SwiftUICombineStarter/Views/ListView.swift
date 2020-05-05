//
//  ListView.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI
import UIKit

struct ListView: View {
    
   var items = [ListItem(title: "Name", subTitle: "Jack Ryan", image: "info"),
                 ListItem(title: "Contact", subTitle: "9876543210", image: "phone"),
                 ListItem(title: "Asset", subTitle: "PDF", image: "doc")]
    
    var body: some View {
        List(items, id: \.title) { item in
            ItemCell(item: item)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
