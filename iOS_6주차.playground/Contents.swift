//// 옵셔널 체이닝이란?
//// 옵셔널 값에 접근하기 위해 물음표(?)를 사용하는 문법입니다.
//// 만약 접근하려는 속성, 메서드, 혹은 서브스크립트가 옵셔널 값을 반환한다면, 물음표를 이용하여 체이닝을 계속할 수 있습니다.
//class Person {
//    var name: String
//    var age: Int?
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let person: Person? = Person(name: "John")
//let age = person?.age

//// 옵셔널 변수 선언시 자료형 뒤에 ?나 !추가
//var x : String? = "Hi"//Hi지우고도 실습
//
//let b1 = x?.count // 옵셔널 체이닝 : 변수뒤에 ? 쓰는 것
//print(type(of:b1),b1) // 크래쉬 안남! 하지만 옵셔널 형으로 출력됨
//
//let c = x ?? "" // 닐합병연산자
//print(c)


//var x: Int = 10
//class Person {
//  var name: String
//  var age: Int
//  init(name: String, age: Int) {
//   self.name = name
//   self.age = age
//  }
//}
//let kim: Person = Person(name: "Kim", age: 20)
//print(kim.age) // 20
//
//let han: Person? = Person(name: "Han", age: 25)
//// 강제 언래핑으로 접근, 크래쉬 위험
//print(han!.age) // 25
//
//// 옵셔널 체이닝으로 접근, 크래쉬 위험 없음 하지만 옵셔널 형으로 반환함
//print(han?.age) // Optional(25)
//
//// 일반형으로 반환하는 방법 1 : 옵셔널 체이닝 한 것을 한 번더 강제 언래핑
//print((han?.age)!) // 25
//
//// 일반형으로 반환하는 방법 2 : 옵셔널 바인딩 if let
//if let hanAge = han?.age {
//print(hanAge) // 25
//} else {
//print("nil")
//}




