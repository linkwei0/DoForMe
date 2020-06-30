//
//  CustomTextField.swift
//  DoForMe
//
//  Created by Артём Бацанов on 03.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import UIKit

//Пока не использую
class CustomTextField: UITextField{
    
    let padding: CGFloat
    
    init (padding: CGFloat){
        self.padding = padding
        super.init(frame: .zero)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize{
        return .init(width: 0, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

