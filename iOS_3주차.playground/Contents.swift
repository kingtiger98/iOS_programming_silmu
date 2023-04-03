func gop(_ a: Int, _ b: Int) -> Int {
    print(#function)
    // #function은 함수명을 출력함
    // 스위프트는 함수명이 매개변수까지 나옴
    return a * b
}
print(gop(10, 20))
// gop(_:_:)  -  함수명
// 200
//print(type(of: gop))
// (Int, Int) -> Int

func gop(a: Int, b: Int) -> Int {
    print(#function)
    // #function은 함수명을 출력함
    // 스위프트는 함수명이 매개변수까지 나옴
    return a * b
}
print(gop(a: 10, b: 20))
//gop(a:b:)  -  함수명
//200
//print(type(of: gop))
// (Int, Int) -> Int

func gop(first a: Int, second b: Int) -> Int {
    print(#function)
    // #function은 함수명을 출력함
    // 스위프트는 함수명이 매개변수까지 나옴
    return a * b
}
print(gop(first: 10, second: 20))
//gop(first:second:)  -  함수명
//200
//print(type(of: gop))
// (Int, Int) -> Int

func gop(_ a: Int, with: Int) -> Int {
    print(#function)
    // #function은 함수명을 출력함
    // 스위프트는 함수명이 매개변수까지 나옴
    return a * with
}
print(gop(10, with: 20))
//gop(_:with:)  -  함수명
//200
//print(type(of: gop))
// (Int, Int) -> Int
