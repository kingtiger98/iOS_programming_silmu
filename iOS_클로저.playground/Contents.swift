// 클로저
// 함수
func mul(val1: Int, val2: Int) -> Int {
return val1 * val2
}

var result = mul(val1:10, val2:20)
print(result)

// 위 함수를 클로저로
let multiply = {(x: Int, y: Int) -> Int in
    return x * y
} // multiply의 자료형은 : (Int, Int) -> Int
print(multiply(10, 20)) // 클로저는 매개변수명 안씀!



// 후행클로저 : 클로저가 함수의 마지막 argument라면 마지막 매개변수명을 생략한 후 함수 소괄호 외부에 클로저를 작성

// 함수 : 마지막 매개변수가 함수임
func math(x: Int, y:Int, cal:(Int, Int) -> Int) -> Int {
    return cal(x, y)
}

// 클로저
result = math(x: 10, y: 20, cal: {(val1: Int, val2: Int) -> Int in
    return val1 + val2
})
print(result)

// 후행클로저
result = math(x: 10, y: 20) {(val1: Int, val2: Int) -> Int in
    return val1 + val2
}
print(result)


// 연습 도전
func bb(){
    print("B")
}

func cc(){
    print("C")
}

func aa(x: Int, a:() -> Void) {
    print("A1", x)
    a()
    print("A2", x)
}

aa(x: 1, a: bb)
aa(x: 2, a: cc)

// 클로저
aa(x: 3, a: {() -> Void in
    print("DD")
})

// 후행클로저
aa(x: 4) {
    print("EE")
}

