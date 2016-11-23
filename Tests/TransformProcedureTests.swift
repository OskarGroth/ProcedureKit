//
//  ProcedureKit
//
//  Copyright © 2016 ProcedureKit. All rights reserved.
//

import XCTest
import TestingProcedureKit
@testable import ProcedureKit

class TransformProcedureTests: ProcedureKitTestCase {

    func test__requirement_is_transformed_to_result() {
        let timesTwo = TransformProcedure<Int, Int> { return $0 * 2 }
        timesTwo.input = .ready(2)
        wait(for: timesTwo)
        XCTAssertProcedureFinishedWithoutErrors(timesTwo)
        XCTAssertEqual(timesTwo.output.success ?? 0, 4)
    }

    func test__requirement_is_nil_finishes_with_error() {
        let timesTwo = TransformProcedure<Int, Int> { return $0 * 2 }
        wait(for: timesTwo)
        XCTAssertProcedureFinishedWithErrors(timesTwo, count: 1)
    }
}
