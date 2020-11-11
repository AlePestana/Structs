//
//  CourseHome.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseHome: View {
    
    var data: Struct
    var structIndex: Int
    
    var body: some View {
        
        VStack {
            
            HomeHeader(data: data)
            Divider()
            List {
                ForEach(0..<data.topics.count) {
                    i in
                    NavigationLink(
                        destination: LessonView(data: data.topics[i], structIndex: structIndex, topicIndex: i)) {
                        
                        TopicRow(topic: data.topics[i], prevTopic: data.topics[data.topics[i].id - 1])
                        
                    }
                    .disabled(data.topics[i].id > 1 && !data.topics[data.topics[i].id - 1].completed)
                }
                
                
                
            }
            .navigationBarTitle(Text("Structs"))

        }
    }
}


struct HomeHeader: View {
    
    var data: Struct
    
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
    
    var topic: Topic
    var prevTopic: Topic
    
    
    var body: some View {
        HStack {
            Text(topic.name)
            Spacer()
            
            Image(systemName: topic.completed || topic.id == 1 ? "lock.open" : "lock")
            
        }
    }
}

struct CourseHome_Previews: PreviewProvider {
    static var previews: some View {
        CourseHome(data: structData[0], structIndex: 0)
    }
}
