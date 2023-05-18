// extension
//extension Double {
//    var squared : Double {
//        return self * self
//    }
//}
//
//2.5.squared // 6.25




// enum
//enum Compass {
//    case North
//    case South
//    case East
//    case West
//}
//print(Compass.North) // North
//var x : Compass //Compass형 인스턴스 x 생성
//x = Compass.West
//print(x, type(of:x)) // West Compass
//x = .East
//print(x) //East




//enum Compass {
//    case North
//    case South
//case East
//case West
//}
//var direction : Compass
//direction = .South
//switch direction { //switch의 비교값이 열거형 Compass
//case .North:
//    print("북")
//case .South:
//    print("남")
//case .East:
//    print("동")
//direction이 .North이면 "북" 출력
//case .West:
//    print("서") //모든 열거형 case를 포함하면 default 없어도 됨
//}




//enum Week: String {
//case Mon, Tue, Wed, Thur, Fri, Sat, Sun
//    func printWeek() { //메서드도 가능
//        switch self {
//        case .Mon, .Tue, .Wed, .Thur, .Fri:
//            print("주중")
//        case .Sat, .Sun:
//            print("주말")
//        }
//    }
//}
//
//Week.Sun.printWeek() // 주말




//enum Color: Int {
//    case red
//    case green = 2
//    case blue
//}
//print(Color.red) // red
//print(Color.blue) // blue
//print(Color.red.rawValue) // 0
//print(Color.blue.rawValue) // 3




//enum Week: String {
//    case Monday = "월"
//    case Tuesday = "화"
//    case Wednesday = "수"
//    case Thursday = "목"
//    case Friday = "금"
//    case Saturday //값이 지정되지 않으면 case 이름이 할당됨
//    case Sunday // = "Sunday"
//}
//print(Week.Monday) //Monday
//print(Week.Monday.rawValue) //월
//print(Week.Sunday) // Sunday
//print(Week.Sunday.rawValue) // Sunday
//print(Week.Saturday) // Saturday
//print(Week.Saturday.rawValue) // Saturday





//enum Date {
//    case intDate(Int,Int,Int) //(int,Int,Int)형 연관값을 갖는 intDate
//    case stringDate(String) //String형 연관값을 값는 stringDate
//}
//
//var todayDate = Date.intDate(2023,4,30)
//
//todayDate = Date.stringDate("2023년 5월 20일") //주석처리하면?
//switch todayDate {
//    case .intDate(let year, let month, let day):
//        print("\(year)년 \(month)월 \(day)일")
//    case .stringDate(let date):
//        print(date) // 2023년 5월 20일, 주석처리하면 : 2023년 4월 30일
//}

//
//class Human {
//    var age : Int = 1
//}
//
//var kim : Human = Human()
//var lee = kim //참조 타입
//print(kim.age, lee.age) // 1 1
//
//lee.age = 20
//print(kim.age, lee.age) // 20 20
//
//kim.age = 30
//print(kim.age, lee.age) // 30 30
//
//var x : Int = 1
//var y = x
//print(x,y) // 1 1
//
//x=2
//print(x,y) // 2 1
//
//y=3
//print(x,y) // 2 3

//참조 타입은 복사할 때 주소를 복사해서
//한 데이터의 reference가 2개 생김



//func myPrint<T>(a: T, b: T) {
//    print(b,a)
//}
//myPrint(a:1,b:2) // 2 1
//myPrint(a:2.5,b:3.5) // 3.5  2.5
//myPrint(a:"Hi",b:"Hello") // Hello Hi



//struct IntStack {
//var items = [Int]()
//mutating func push(_ item: Int) {
//    items.append(item)
//}
//mutating func pop() -> Int {
//    return items.removeLast()
//    }
//}
//
//var stackOfInt = IntStack()
//print(stackOfInt.items) //[]
//stackOfInt.push(1)
//print(stackOfInt.items) //[1]
//stackOfInt.push(2)
//print(stackOfInt.items) //[1,2]
//stackOfInt.push(3)
//print(stackOfInt.items) //[1,2,3]
//print(stackOfInt.pop()) //3
//print(stackOfInt.items) //[1,2]
//print(stackOfInt.pop()) //2
//print(stackOfInt.items) //[1]
//print(stackOfInt.pop()) //1
//print(stackOfInt.items) //[]






//struct Stack <T> {
//var items = [T]()
//mutating func push(_ item: T) {
//    items.append(item)
//}
//mutating func pop() -> T {
//        return items.removeLast()
//    }
//}
//
//다양한 자료형에 대해 같은 알고리즘 적용 가능함
// Int형
//var stackOfInt = Stack<Int>()
//stackOfInt.push(1)
//print(stackOfInt.items)
//stackOfInt.push(2)
//print(stackOfInt.items)
//print(stackOfInt.pop())
//print(stackOfInt.items)
//print(stackOfInt.pop())
//
//// String형
//var stackOfString = Stack<String>()
//stackOfString.push("일")
//print(stackOfString.items)
//stackOfString.push("이")
//print(stackOfString.items)
//print(stackOfString.pop())
//print(stackOfString.items)
//print(stackOfString.pop())

