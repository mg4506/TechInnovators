import UIKit

class RoundCheckboxButton: UIButton {
    var isChecked: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        updateUI()
    }
    
    private func updateUI() {
        let imageName = isChecked ? "checkmark.circle.fill" : "circle"
        setImage(UIImage(systemName: imageName), for: .normal)
        tintColor = isChecked ? .green : .blue
    }
    
    @objc private func checkboxTapped() {
        isChecked.toggle()
    }
}
