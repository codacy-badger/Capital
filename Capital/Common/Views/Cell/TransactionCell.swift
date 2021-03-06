import UIKit

protocol TransactionCellProtocol: class {
    var date: SimpleLabelProtocol {get set}
    var from: SimpleLabelProtocol {get set}
    // swiftlint:disable identifier_name
    var to: SimpleLabelProtocol {get set}
    var amount: SimpleLabelProtocol {get set}
}

class TransactionCell: UITableViewCell, TransactionCellProtocol {
    var date: SimpleLabelProtocol = SimpleLabel(alignment: .center, lines: 2)
    var from: SimpleLabelProtocol = SimpleLabel()
    // swiftlint:disable identifier_name
    var to: SimpleLabelProtocol = SimpleLabel()
    var amount: SimpleLabelProtocol = NumberLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        contentView.add(
            subViews: ["date": date as? UIView, "from": from as? UIView,
                       "to": to as? UIView, "amount": amount as? UIView ],
            withConstraints: ["H:|-15-[date(70)]-10-[from]-5-[amount(50)]-5-|",
                              "H:|-95-[to(==from)]", "V:|[date]|", "V:|[from(22)]",
                              "V:[to(22)]|", "V:|[amount]|"])
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
