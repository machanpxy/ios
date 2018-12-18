import UIKit

var str = "Hello, playground"
////最后一题的部分代码/////
class Teacher:Person {
    var department: Department
    var title: String
    init(title: String, department:Department, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: .male)
    }
    init(title: String, department:Department)
    {
        self.title = title
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: .male)
    }
    convenience required init() {
        self.init(title: "", department:.short)
    }
    override var des: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    //实现run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    //实现协议的方法
    func lendBook() {
        print("Teacher \(self.fullName)get one book")
    }
}
var teacher1 = Teacher(title:"good", department: .short)
print(teacher1)
class Student:Person {
    var department: Department
    var stuNo: Int
    init(stuNo: Int, department: Department, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    init(stuNo: Int, department: Department)
    {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender:.male)
    }
    convenience required init() {
        self.init(stuNo: 0, department: .high)
    }
    
    override var des: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender), department: \(self.department)"
    }
    //实现run方法
    override func run() {
        print("Student \(self.fullName) is running")
    }
    //实现协议的方法
    func lendBook() {
        print("Student \(self.fullName)get one book")
    }
}
let student1 = Student(stuNo:20161100202, department: .high)
print(student1)

