//
//  ViewController.swift
//  gankio
//
//  Created by yuhaocan on 2020/1/27.
//  Copyright © 2020 yuhaocan. All rights reserved.
//

import UIKit

import Alamofire
import KingfisherSwiftUI
import SwiftyJSON

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var girls : Array<String> = []
     let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
    var collectionView : UICollectionView?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return girls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: girls[indexPath.item]))
         cell.addSubview(imageView)
        imageView.snp.remakeConstraints({
                           (maker) in
                           maker.top.equalTo(0)
                           maker.left.equalTo(0)
                           maker.right.equalTo(0)
                           maker.bottom.equalTo(0)
                       })
        return cell
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.navigationController?.navigationBar.barTintColor = UIColor.white
            self.title = "GankIo"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.view.frame.width, height: 500)
        collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundView?.backgroundColor = UIColor.white; collectionView?.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView!)
        
//        let imageView = UIImageView()
//
//        imageView.kf.setImage(with: URL(string: "https://ww1.sinaimg.cn/large/0065oQSqgy1fu39hosiwoj30j60qyq96.jpg"))
//        imageView.kf.indicatorType = .activity
//
//         self.view.addSubview(imageView)
//        imageView.snp.remakeConstraints({
//                   (maker) in
//                   maker.top.equalTo(0)
//                   maker.left.equalTo(0)
//                   maker.right.equalTo(0)
//                   maker.bottom.equalTo(0)
//               })
        self.view.backgroundColor = UIColor.white
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
//        label.text = "hello world"
//        self.view.addSubview(label)
//
//
//        let button = UIButton(type: UIButton.ButtonType.system)
//        button.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
//        button.setTitle("sddd", for: .normal)
//        button.addTarget(self,action: #selector(ViewController.ret), for: .touchUpInside)
//         self.view.addSubview(button)
        getGirls()
    }
    
     @objc func ret(){
//       let viewController2 = ViewController2()
//        viewController2.modalPresentationStyle = UIModalPresentationStyle.fullScreen;
//        self.navigationController?.pushViewController(viewController2, animated: true)
        self.present(ViewController2(), animated: true, completion: nil)
    }
    
    func getGirls(){
        let parameters: Dictionary = ["page" : 1]
    AF.request("http://i.jandan.net/?oxwlxojflwblxbsapi=jandan.get_ooxx_comments", method:.get).responseJSON { (response) in
        
        
            switch response.result {
            case .success:
                let arrays = JSON(response.value )["comments"]
                for index in 0..<arrays.count{
                    if let url = arrays[index]["pics"][0].string{
                        self.girls.append(url)
                    }
                }
                self.collectionView?.reloadData()
//                if let url = arrays[0]["pics"][0].string{
//                    self.label.text = url
//                }else{
//                     self.label.text = "fff"
//                }
//                self.label.text = response.value as! String
                print("SUCCESS")
//                 self.label.text = "SUCCESS"
            case .failure:
//                self.num = 1
//                self.label.text = "ERROR"
                print("ERROR")
//                 self.label.text = "ERROR"
            }
        }
    }

}



