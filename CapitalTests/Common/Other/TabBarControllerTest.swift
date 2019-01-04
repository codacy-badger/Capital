import XCTest
@testable import Capital

class TabBarControllerTests: XCTestCase{
    /// Test check that TabBar controller gets 5 pages: DashBoard, Accounts, New Transaction, Transactions, Settings
    func testInitWithVC() {
        let vc = TabBarController()
        XCTAssertTrue((vc.viewControllers?[0] as! NavigationController).viewControllers[0] as? AccountGroupsViewController != nil)
        //FIXME: add the rest VCs
    }
}