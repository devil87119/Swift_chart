//
//  LoverRow.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverRow: View {
    
    var lover: Lover

    var body: some View {
        HStack {
            Text(lover.name)
            Spacer()
            Text("\(lover.hours) hr")
            Image(systemName: lover.trueHeart ? "heart.fill" : "heart")
        }
        
    }
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        LoverRow(lover: Lover(name: "睡覺", hours: 0, trueHeart: true))
    }
}
