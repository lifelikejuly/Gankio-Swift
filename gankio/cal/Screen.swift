//
//  Screen.swift
//  gankio
//
//  Created by yuhaocan on 2020/2/1.
//  Copyright © 2020 yuhaocan. All rights reserved.
//

import Foundation
import UIKit

class Screen: UIView {
    var inputLabel : UILabel?
    var historyLabel : UILabel?
    var inputString = ""
    var historyString = ""
    let figureArray:Array<Character> = ["0","1","2","3","4","5","6","7","8","9","."]
    let funcArray =  ["+","-","*","/","%","^"]
    init() {
        inputLabel = UILabel()
        historyLabel = UILabel()
        super.init(frame:CGRect.zero)
        installUI()
        
//        self.backgroundColor = UIColor.red
    }
    
    func installUI(){
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        
        inputLabel?.font = UIFont.systemFont(ofSize: 34)
        historyLabel?.font = UIFont.systemFont(ofSize: 30)
        
        inputLabel?.textColor = UIColor.orange
        historyLabel?.textColor = UIColor.black
        
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0
        self.addSubview(inputLabel!)
        self.addSubview(historyLabel!)
        
        inputLabel?.snp.makeConstraints({
            (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
        historyLabel?.snp.makeConstraints({
                   (maker) in
                   maker.left.equalTo(10)
                   maker.right.equalTo(-10)
                   maker.top.equalTo(10)
                   maker.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.5).offset(-10)
               })
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func inputContent(content:String){
        
        if !figureArray.contains(content.last!) && !funcArray.contains(content){
            return;
        }
        if inputString.count > 0{
            if figureArray.contains(inputString.last!){
                inputString.append(content)
                inputLabel?.text = inputString
            }else{
                if figureArray.contains(content.last!){
                    inputString.append(content)
                    inputLabel?.text = inputString
                }
            }
        }else{
            if figureArray.contains(content.last!){
                inputString.append(content)
                inputLabel?.text = inputString
            }
        }
    }
    
    func refreshHistory(){
        historyString = inputString
        historyLabel?.text = historyString
    }
    
    func clearContent(){
        inputString = ""
    }
    
    func deleteInput(){
        if inputString.count > 0{
            inputString.remove(at: inputString.index(before: inputString.endIndex))
            inputLabel?.text = inputString
        }
    }
}
