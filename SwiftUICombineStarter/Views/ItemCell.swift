//
//  ItemCell.swift
//  SwiftUICombineDemo
//
//  Created by Khasnobis, Pritha on 03/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct ItemCell: View {
    
    var item: ListItem
    
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(item.title).font(.headline)
                Text(item.subTitle).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
        }
    }
}
