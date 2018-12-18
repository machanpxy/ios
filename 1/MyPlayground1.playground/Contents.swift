import UIKit

var str = "Hello, playground"
func findZ() -> [Int]{
    var Array1 = [2,3]
    var flag = true
    for num in 4...10000{
        for x in 2..<num {
            if num % x == 0{
                flag = false
                break
            }
        }
        if flag {
            Array1.append(num)
        }
        flag = true
    }
    return Array1
}
var number = findZ()
/****第一种******/
//升序排序
number.sort()
//降序排序
func downz(x: Int, y: Int) -> Bool {
    return x > y
}
number.sort(by: downz)

/****第二种******/
//降序排序
number.sort
    {
        (x,y)->Bool in
        return x>y
}
/****第三种******/
//降序排序
number.sort(by:>)

/****第四种******/
//降序排序
number.sort{
    (x,y) in
    return x>y
}

/****第五种******/
//降序排序
number.sort(by:{
    (x,y)-> Bool in
    return x>y
})
print(number)



//////////////////////////////////////////
enum Gender :Int {
    case famale
    case male
    
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

class Person{
    var firstName: String
    var lastName : String
    var age: Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName + lastName
        }
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName: String, age: Int, gender: Gender){
        self.init(firstName:firstName , lastName:"" , age:age, gender: gender)
    }
    //重载==
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    //重载!=
    static func !=(lhs: Person, rhs: Person) -> Bool {
        return !(lhs == rhs)
    }
    
    //    func des() ->String{
    //    return "Name:\(fullName) Age:\(age) Gender"\(gender)"
    //    }
    var des:String{
        return "fullName:\(self.fullName),age:\(self.age),gender：\(self.gender)"
    }
}
let p1 = Person(firstName:"Wang",lastName:"Mei",age:19,gender:Gender.male)
let p2 = Person(firstName:"Zhang",lastName:"kai",age:20,gender:Gender.famale)
print(p1)
print(p1 == p2)  //输出false
print(p1 != p2)  //输出true
class Teacher:Person {
    var title: String
    init(title: String, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    init(title: String) {
        self.title = title
        super.init(firstName: "", lastName: "", age: 0, gender: .male)
    }
    convenience required init() {
        self.init(title: "")
    }
    override var des: String {
        return "title: \(self.title), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
}
var teacher1 = Teacher(title: "good")
print(teacher1)
class Student:Person {
    var stuNo: Int
    init(stuNo: Int, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    init(stuNo: Int) {
        self.stuNo = stuNo
        super.init(firstName: "", lastName: "", age: 0, gender: Gender.male)
    }
    required convenience init() {
        self.init(stuNo: 0)
    }
    override var des: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
}
let student1 = Student(stuNo:20161100202)
print(student1)

var Array = [Person]()
for i in 1...3{
    let arrayPerson = Person(firstName: "li", lastName: "\(i)", age: 19, gender: .male)
    Array.append(arrayPerson)
}
for i in 1...3 {
    let arrayTeacher = Teacher(title: "good", firstName: "wang", lastName: "\(i)", age: 21, gender: .famale)
    Array.append(arrayTeacher)
}

for i in 1...4 {
    let arrayStudent = Student(stuNo: 2016110202 + i, firstName: "zhang", lastName: "\(i)", age: 19, gender: .male)
    Array.append(arrayStudent)
}
// 第四题
var dic = ["Person": 0, "Teacher": 0, "Student": 0]
for item in Array {
    if item is Teacher {  //判断Teacher
        dic["Teacher"]! += 1
    } else if item is Student {  //判断Student
        dic["Student"]! += 1
    } else {  //判断Person
        dic["Person"]! += 1
    }
}

//字典值
for (key, value) in dic {
    print("\(key) has \(value) items")
}

//数组
for item in Array {
    print(item)
}

//age
print("按照age")
Array.sort { return $0.age > $1.age}
for item in Array {
    print(item)
}
//gender，age
print("按照gender，age")
Array.sort { return ($0.gender > $1.gender) && ($0.age > $1.age) }
for item in Array {
    print(item)
}

//fullname
print("按照fullname")
Array.sort { return $0.fullName < $1.fullName}
for item in Array {
    print(item)
}

