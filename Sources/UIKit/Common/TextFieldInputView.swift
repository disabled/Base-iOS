//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit
import Framezilla

open class TextFieldInputView: UIView {

    open var textFieldInsets: UIEdgeInsets {
        get {
            textField.insets
        }
        set {
            textField.insets = newValue
            layout()
        }
    }

    open var showPasswordButtonRightInset: CGFloat = 14

    open var textFieldTextDidChangeHandler: ((String) -> Void)?
    open var textFieldBeginEditingHandler: (() -> Void)?
    open var textFieldShouldReturnHandler: (() -> Bool)?

    // MARK: - Subviews

    private(set) open lazy var textField: SecureTextField = {
        let view = SecureTextField()
        view.clearsOnBeginEditing = false
        view.autocorrectionType = .no
        view.smartInsertDeleteType = .no
        view.delegate = self
        view.textDidChangeHandler = { [weak self] text in
            self?.textFieldTextDidChangeHandler?(text)
        }
        return view
    }()

    private(set) open lazy var showPasswordButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(showPasswordButtonPressed), for: .touchUpInside)
        view.isHidden = true
        return view
     }()

    // MARK: - Lifecycle

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        showPasswordButton.configureFrame { maker in
            maker.right(inset: showPasswordButtonRightInset).top().bottom().widthToFit()
        }

        textField.configureFrame { maker in
            var insets = textFieldInsets
            if showPasswordButton.isHidden == false {
                insets.right += showPasswordButton.frame.width + showPasswordButtonRightInset
            }
            maker.edges(insets: insets)
        }
    }

    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let constrainedSize = size - textFieldInsets
        let textFieldSize = textField.sizeThatFits(constrainedSize)
        return textFieldSize + textFieldInsets
    }

    @discardableResult
    open override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }

    @discardableResult
    open override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
    }

    // MARK: - Private

    private func setup() {
        add(textField, showPasswordButton)
    }

    @objc private func showPasswordButtonPressed() {
        showPasswordButton.isSelected.toggle()
        textField.isSecureTextEntry.toggle()
    }
}

extension TextFieldInputView: UITextFieldDelegate {

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldShouldReturnHandler?() ?? true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBeginEditingHandler?()
    }
}
