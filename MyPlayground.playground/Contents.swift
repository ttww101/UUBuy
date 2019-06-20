import UIKit

class Student: NSObject, Codable{
    var id:String = "127182781278"
    var name:String = "小明"
    var grade:Int = 1
    var own = [1, 2, 3]
    var test: String!
}

let json = """
{
    "id": "127182781278",
    "name": "小明",
    "grade": 1
}
"""
//let student = try JSONDecoder().decode(Student.self,from: json.data(using: .utf8)!)


var student2 = Student()
student2.test = "123"
do {
    let jsonData = try JSONEncoder().encode(student2)
    let jsonString = String(decoding: jsonData, as: UTF8.self)
    print(jsonString)
}catch{
    print(error.localizedDescription)
}
