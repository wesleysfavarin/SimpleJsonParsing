//
//  ViewController.swift
//  jsonParsing
//
//  Created by mac on 24/02/19.
//  Copyright © 2019 Wesley S. Favarin. All rights reserved.
//

import UIKit

struct Wsf: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable{
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
//    init(json: [String: Any]){
//        id = json["id"] as? Int ?? -1
//        name = json ["name"] as? String ?? ""
//        link = json ["link"] as? String ?? ""
//        imageURL = json ["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonCourse = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        //let jsonCourse = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        //let jsonCourse = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        //let jsonCourse = "https://api.letsbuildthatapp.com/jsondecodable/course"
        
        
        
        guard let url = URL(string: jsonCourse) else {return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let dataAsString = String(data: data!, encoding: .utf8)
            guard let data = data else {return}
            do {
                
                //json com campos nulos
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
                //objeto com uma lista dentro
                //let wsf = try JSONDecoder().decode(Wsf.self, from: data)
                //print(wsf)
                
                
                //lista
                //let courses = try JSONDecoder().decode([Course].self, from: data)
                //print(courses)
                
                
                //Swift 2/3ObjC
//               guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                as? [String: Any] else {return}
//
//                let course = Course(json: json)
//                print(course.name)
                
                
            } catch let jsonErr {
                print("Erro ao deserializar o json:" , jsonErr)
            }
            
        }.resume()
    }


}

