// 과제1
let myTuple = (10, 12.1, "Hi")
print(type(of: myTuple)) // (Int, Double, String)

// 과제2
var pet1: String?
var pet2: String?
pet1 = "cat"
pet2 = "dog"
if let pet1 = pet1, let pet2 = pet2 { // if let pet1, let pet2 으로 변수명만 써줘도 가능함
    print(pet1, pet2)
    } else {
      print("nil")
}

// 과제3
let names = ["a", "b", "c", "d"]
for name in names[...2] {
    print(name)
}
//a
//b
//c

for name in names[..<2] {
    print(name)
}
//a
//b

// 과제4
let defaultAge = 1
var age : Int? // 정수형 옵셔널 변수 age선언
age = 3 // age에 Optional(3) 대입됨
print(age) // Optional(3)
// age가 nil값이면 defaultAge값이 myAge에 대입, 값이 있으면 age값 대입
var myAge = age ?? defaultAge
print(myAge) // 옵셔널 변수 age가 대입되었지만, myAge는 일반 변수이므로 3 출력

// 과제5
for i in 1..<10 {
    if i > 5 {break}
// 중요!! 에러 수정 과제: error: expected '{' after 'if' condition
    print(i)
}

// 과제6
let weight = 83.0
let height = 178.0
let bmi = weight / (height*height*0.0001) // kg/m*m
var body = ""

switch bmi {
case 0.0 ..< 18.5:
    body = "저체중"
case 18.5 ..< 25:
    body = "정상"
case 25 ..< 30:
    body = "1단계 비만"
case 30 ..< 40:
    body = "2단계 비만"
default:
    body = "3단계 비만"
}
print("BMI:\(bmi), 판정:\(body)")

// 과제7
func triple(_ value : Int?) { // 외부매개변수 생략, 내부매개변수 value 설정
    guard let num = value, num < 100 else {
        print("nil값이거나 값이 100보다 작습니다.") // 조건문이 거짓이면 실행
        return
    }
    // guard문의 특징으로 num변수를 guard문 밖에서도 사용할 수 있다.
    print(num*3) // 조건문이 참이면 실행
}

triple(300) // nil값이거나 값이 100보다 작습니다.
triple(30)  // 90

// 과제8
var temperature = 61
 switch (temperature)
 {
 case 0...49 where temperature % 2 != 0:
     print("Cold and even")
 case 50...79 where temperature % 2 != 0:
     print("Warm and even")
 case 80...110 where temperature % 2 != 0:
     print("Hot and even") default:
   print("Temperature out of range or even")
 }

