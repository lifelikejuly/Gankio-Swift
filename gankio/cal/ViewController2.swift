//
//  ViewController2.swift
//  gankio
//
//  Created by yuhaocan on 2020/1/28.
//  Copyright © 2020 yuhaocan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,BoardButtonInputDelegate {
   
    
    
    let board = Board()
    let screen = Screen()
    
    let calculator = CalculatorEngine()
    var isNew = false
    
    
    func boardButtonClick(content: String) {
           if content == "AC" || content == "Delete" || content == "="{
            switch content {
            case "AC":
                screen.clearContent()
                 screen.refreshHistory()
            case "Delete":
                screen.deleteInput()
            case "=":
                let result = calculator.calculatEquation(equation: screen.inputString)
                screen.refreshHistory()
                screen.clearContent()
                screen.inputContent(content: String(result))
                isNew = true
            default:
                break
            }
           }else{
            if isNew{
                screen.clearContent()
                isNew = false
            }
               screen.inputContent(content: content)
           }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
//            self.title = "Hello"
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(ret))
        
        self.view.backgroundColor = UIColor.white
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
//               label.text = "hello world2"
//
//               self.view.addSubview(label)
//        let button = UIButton(type: UIButton.ButtonType.system)
//               button.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
//        button.setTitle("后退", for: .normal)
//               button.addTarget(self,action: #selector(ViewController2.ret), for: .touchUpInside)
//                self.view.addSubview(button)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 100, height: 100)
//        let collectView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
//
//        collectView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        
        
        installUI()
        
    }
    
    func installUI(){
        self.view.addSubview(board)
        board.delegate = self
        board.snp.makeConstraints({
            (maker) in
            maker.left.equalTo(0)
             maker.right.equalTo(0)
             maker.bottom.equalTo(0)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
        })
        
        self.view.addSubview(screen)
        screen.snp.makeConstraints({
            (maker) in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        })
    }
    
    
     @objc func ret(){
//           self.dismiss(animated: true, completion:nil)
        self.navigationController?.popViewController(animated: true)
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
