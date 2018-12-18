import UIKit

var str = "Hello, playground"
func getDate(date: Date, zone: Int = 0 ) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm"  //指定格式化的格式
    formatter.locale = Locale.current  //显示中文
    if zone >= 0 { //正数时，在东半区
        formatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {  //负数时，在西半区
        formatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    let dateString = formatter.string(from: now)  //将传入的日期格式化为字符串
    return dateString
}

let now = Date()  //获取当前时间日期

let beijing = getDate(date: now, zone: +8)  //北京
print("北京: \(beijing)")

let tokyo = getDate(date: now, zone: 9)  //东京
print("东京: \(tokyo)")

let newYork = getDate(date: now, zone: -5)  //纽约
print("纽约: \(newYork)")

let london = getDate(date: now)  //伦敦
print("伦敦: \(london)")
///////////////////////////////////////


let str1 = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let str2 = str1.replacingOccurrences(of: "OS", with: "")
print(str)
////////////////////////////////////////
let dic = ["date": ["beijing": beijing, "tokyo": tokyo, "newYork": newYork, "london": london], "string": str] as AnyObject

let defaultDoc = FileManager.default
if var path = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
    path.append("/test.txt")  //在文件夹路径下增加一个test.txt
    
    print(dic.write(toFile: path, atomically: true))  //新建指定的文件，并将数据写入(输出: true)
}

//////////////////
let image = try Data(contentsOf: URL(string: " http://pic14.nipic.com/20110605/1369025_165540642000_2.jpg ")!)

if var url = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first {
    url.appendPathComponent("image.png")
    try image.write(to: url)  //将转换后的二进制数据存储为png图片
}
////////////////////
let url = URL(string: "http://www.weather.com.cn/data/sk/101110101.html")!
let data = try Data(contentsOf: url)  //将json转换为二进制数据
let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  //序列化json

//解析json数据
if let dic = json as? [String: Any] {
    if let weather = dic["weatherinfo"] as? [String: Any] {
        let city = weather["city"]!
        let temp = weather["temp"]!
        let wd = weather["WD"]!
        let ws = weather["WS"]!
        print("城市: \(city), 温度: \(temp), 风向: \(wd), 风力: \(ws)")
    }
}
