//
//  ViewController.swift
//  NetWork
//
//  Created by wanfengxixi on 2021/12/10.
//

import UIKit
import RxSwift
typealias OSViewController = UIViewController
class ViewController: UIViewController {
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        getOrignNet()
//        getNet2()
        postOrignNet()
    }
    @IBAction func button(_ sender: UIButton) {
        let story =  UIStoryboard(name: "PicckerStoryboard", bundle: nil)
        let controller = story.instantiateInitialViewController()
        navigationController?.pushViewController(controller!, animated: true)
    }
    

}

