import XCTest
@testable import Capital

class SimpleLabelTests: XCTestCase {
    func testInitWithCoder() {
        // 1. Arrange
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        
        // 2. Action
        let view =  SimpleLabel(coder: archiver)
        
        // 3. Assert
        XCTAssertNil(view)
    }
    
    func testInitWithText() {
        //given
        let text = "1"
        //when
        let sample = SimpleLabel(text)
        //then
        XCTAssertTrue(sample.text == text)
    }

    func testInitWithStringAlignLines() {
        // given
        let text = "1"
        let alignment = NSTextAlignment.right
        let lines = 10
        
        // when
        let sample = SimpleLabel(text, alignment: alignment, lines: lines)
        
        // then
        XCTAssertTrue(sample.text == text && sample.textAlignment == alignment && sample.numberOfLines == lines)
    }

}