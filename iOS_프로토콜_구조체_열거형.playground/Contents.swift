// 프로토콜
protocol Information { // 프로토콜 정의!
    var x: Int {get set} // 읽기 쓰기 전용 프로퍼티 선언!
    func name() // 메서드 선언!, 내용은 없음
}

class Man1 : Information { // Information 프로토콜 채택
    var x: Int = 1 // 프로토콜 준수
    func name() { // 프로토콜 준수
        print("메서드 내용은 여기서 작성!")
    }
}


// 구조체
struct Body {
    var height: Double = 178.8
    var weight: Int = 83
}

class Man2 {
    var name: String = "황재하"
    var shape: Body = Body()
}

let myInfo = Man2()
print(myInfo.shape.height)

// 열거형

