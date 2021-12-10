//
//  Picker1.swift
//  NetWork
//
//  Created by wanfengxixi on 2021/12/10.
//

import UIKit
import RxSwift
import RxCocoa

final class Picker1:ViewController{
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable.just([[1,2,3],[2,5,8,13],[24,34,67]])
            .bind(to: pickerView.rx.items(adapter: PikckerViewAdapter()))
            .disposed(by: disposeBag)
    }
}

final class PikckerViewAdapter
:NSObject
,UIPickerViewDelegate
, UIPickerViewDataSource
, RxPickerViewDataSourceType
, SectionedViewDataSourceType{
    typealias Element = [[CustomStringConvertible]]
    private var items:[[CustomStringConvertible]] = []
    
    func model(at indexPath: IndexPath) throws -> Any {
        items[indexPath.section][indexPath.row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        items.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        items[component].count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = items[component][row].description
        label.textColor = UIColor.orange
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }
    func pickerView(_ pickerView: UIPickerView, observedEvent: Event<[[CustomStringConvertible]]>) {
        Binder(self){ (adapter,items)in
            adapter.items = items
            pickerView.reloadAllComponents()
        }.on(observedEvent)
    }
    
}
