//
//  CourseHome.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseHome: View {
    
    @Binding var data: Struct
    var structIndex: Int
    
    var body: some View {
        
        VStack {
            HomeHeader(data: $data, structIndex: structIndex)
            Divider()
            List {
                ForEach(0..<data.topics.count) {
                    i in
                    NavigationLink(
                        destination: LessonView(data: data.topics[i], structIndex: structIndex, topicIndex: i)) {
                        
                        TopicRow(topic: $data.topics[i], prevTopic: i == 0 ? $data.topics[i] : $data.topics[i-1])
                    }
                    .disabled(i == 0 ? false : !data.topics[i-1].completed)
                }
            }
            .navigationBarTitle(Text("Structs"))
            .onAppear(perform: {
                self.data = loadJSON("data.json")[structIndex]
            })
        }
    }
}


struct HomeHeader: View {
    
    @Binding var data: Struct
    var structIndex: Int
    
    var body: some View {
        VStack(alignment: .leading)  {
            
            HStack {
                Spacer()
            }
            
            //
            //            Progress(value: data.percentage)
            //                .offset(x: 0, y: -10)
            //                .frame(width: 200)
            Text(data.description)
                .font(.footnote)
            
            Text("Temas")
                .padding(.top, 20)
                .font(.footnote)
        }
        .navigationBarTitle(Text(data.lesson))
        .padding(.horizontal,20)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
}


struct TopicRow: View {
    
    @Binding var topic: Topic
    @Binding var prevTopic: Topic
    
    
    var body: some View {
        HStack {
            Text(topic.name)
            Spacer()
            
            Image(systemName: topic.completed || topic.id == 1 || prevTopic.completed ? "lock.open" : "lock")
            
        }
    }
}

//struct CourseHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseHome(data: structData[0], structIndex: 0)
//    }
//}

