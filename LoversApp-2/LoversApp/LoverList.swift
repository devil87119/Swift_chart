//
//  LoverList.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverList: View {
    
    @ObservedObject var loversData = LoversData()
    @State private var showEditLover = false
    
    
    var body: some View {
        NavigationView {
            VStack(){
                ZStack(){
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(0.0)
                        , endAngle: .degrees(Double(8*360/24))
                        , clockwise:false)}
                        .fill(Color.purple)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(8*360/24))
                        , endAngle: .degrees(Double(16*360/24))
                        , clockwise:false)}
                        .fill(Color.blue)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(16*360/24))
                        , endAngle: .degrees(Double(17*360/24))
                        , clockwise:false)}
                        .fill(Color.red)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(17*360/24))
                        , endAngle: .degrees(Double(18*360/24))
                        , clockwise:false)}
                        .fill(Color.yellow)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(18*360/24))
                        , endAngle: .degrees(Double(19*360/24))
                        , clockwise:false)}
                        .fill(Color.gray)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(19*360/24))
                        , endAngle: .degrees(Double(21*360/24))
                        , clockwise:false)}
                        .fill(Color.green)
                    Path { (path)in
                        path.move(to:CGPoint(x:200, y:200))
                        path.addArc(center:CGPoint(x:200, y:200)
                        , radius:100
                            , startAngle: .degrees(Double(21*360/24))
                        , endAngle: .degrees(Double(24*360/24))
                        , clockwise:false)}
                        .fill(Color.black)
                }
            List {
                ForEach(loversData.lovers) { (lover) in
                    NavigationLink(destination: LoverEditor(loversData: self.loversData, editLover: lover)) {
                        LoverRow(lover: lover)
                    }
                }
                .onDelete { (indexSet) in
                    self.loversData.lovers.remove(atOffsets: indexSet)
                }sß
            }
            .navigationBarTitle("今日剩餘時間分配"+String(24-total.hr)+"hr")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEditLover = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEditLover) {
                    NavigationView {
                         LoverEditor(loversData: self.loversData)
                    }
                }
            }
        }
    }
}

struct LoverList_Previews: PreviewProvider {
    static var previews: some View {
        LoverList()
    }
}
