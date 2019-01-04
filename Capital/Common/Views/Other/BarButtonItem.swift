
class BarButtonItem: UIBarButtonItem {
    
    var tapAction: (()->())?
    
    convenience init(assetName: String, action: (()->())?) {
        let barButton = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        let barButtonImage = UIImage(named: assetName)?.withRenderingMode(.alwaysTemplate)
        barButton.setImage(barButtonImage, for: .normal)
        barButton.tintColor = UIColor.white
        self.init(customView: barButton)
        self.action = #selector(didTap)
        barButton.addTarget(self, action: self.action!, for: .touchUpInside) //FIXME: !
    }
    
    convenience init(title: String, action: (()->())?) {
        let barButton = UIButton(frame: .zero)
        barButton.sizeToFit()
        barButton.setTitle(title, for: UIControl.State.normal)
        barButton.setTitleColor(.blue, for: .normal)
        barButton.setTitleColor(.lightGray, for: .selected)
        self.init(customView: barButton)
        self.tapAction = action
        barButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        self.action = #selector(didTap)
    }
    
    private override init() {super.init()}
    required init?(coder aDecoder: NSCoder) {return nil}
    @objc func didTap() {tapAction?()}
}