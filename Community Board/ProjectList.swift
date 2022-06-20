//
//  ListView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

struct ProjectList {
    // TODO: complete ProjectList
    var project1 = Project(name: "Planting flowers", type: "C", date: "6/18/22", time: "5:00 pm", id: "1")
    var project2 = Project(name: "Moving furniture", type: "P", date: "6/19/22", time: "11:00 am", id: "2")
    var project3 = Project(name: "Picking up trash", type: "C", date: "6/22/22", time: "6:00 pm", id: "3")
    var project4 = Project(name: "Painting fence", type: "P", date: "6/25/22", time: "2:00 pm", id: "4")
    
    var projects: [Project]
    init() {
        projects = [project1, project2, project3, project4]
    }
}

struct Project : Identifiable {
    // TODO: complete Project struct
    var name: String
    var type: String
    var date: String
    var time: String
    var id: String
}
