//
//  DatePickerTableViewCellSampleTests.swift
//  DatePickerTableViewCellSampleTests
//
//  Created by Fumiya Tanaka on 2022/05/08.
//

import XCTest
import SnapshotTesting
@testable import DatePickerTableViewCellSample

class DatePickerTableViewCellSampleTests: XCTestCase {

    var isRecording: Bool!

    override func setUp() {
        super.setUp()
        isRecording = ProcessInfo.processInfo.environment["Enable-Snapshot-Record-Mode"] == "true"
    }

    func test_初期レイアウト() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPhoneXsMax),
            record: isRecording
        )
    }

    func test_一番上のボタンをタップ() {
        let window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        let cell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! TableViewCell
        cell.tapActionButton()
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPhoneXsMax),
            record: isRecording
        )
    }
}
