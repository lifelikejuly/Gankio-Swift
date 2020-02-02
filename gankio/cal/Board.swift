//
//  Board.swift
//  gankio
//
//  Created by yuhaocan on 2020/2/1.
//  Copyright © 2020 yuhaocan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class Board: UIView {
    
    var delegate: BoardButtonInputDelegate?
    var dataArray = [
    "0",".","%","=",
    "1","2","3","+",
    "4","5","6","-",
    "7","8","9","*",
    "AC","Delete","^","/"
    ]
    override init(frame: CGRect) {
        super.init(frame: frame)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installUI() {
        var frontBtn : FuncButton!
        for index in 0..<20{
            let btn = FuncButton()
            self.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                if index % 4 == 0{
                    make.left.equalTo(0)
                }else{
                    make.left.equalTo(frontBtn.snp.right)
                }
                if index / 4 == 0{
                    make.bottom.equalTo(0)
                }else if index % 4 == 0{
                     make.bottom.equalTo(frontBtn.snp.top)
                }else{
                      make.bottom.equalTo(frontBtn.snp.bottom)
                }
                make.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25)
                make.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
            })
            btn.tag = index + 100
            btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            btn.setTitle(dataArray[index], for: .normal)
            frontBtn = btn
        }
//         self.backgroundColor = UIColor.red
    }
    
   @objc func btnClick(button: FuncButton){
        if delegate != nil{
            delegate?.boardButtonClick(content: button.currentTitle!)
        }
    }
   
}


   protocol BoardButtonInputDelegate {
       func boardButtonClick(content: String)
   }
