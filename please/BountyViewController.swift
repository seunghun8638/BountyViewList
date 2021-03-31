//
//  BountyViewController.swift
//  please
//
//  Created by 오승훈 on 2021/03/31.
//

import UIKit

class BountyViewController : UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //UITableVIewDataSource -> 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //indexPath -> cell위치를 표시
        
        return cell
        //checkpoint -> 악세사리
    }
    //UITableVIewDelegate -> 눌럿을 때 출력창에 나옴
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--->\(indexPath.row)")
    }
}
