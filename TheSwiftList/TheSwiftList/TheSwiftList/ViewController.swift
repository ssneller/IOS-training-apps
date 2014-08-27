//
//  ViewController.swift
//  TheSwiftList
//
//  Created by Steve Sneller on 8/22/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

import UIKit
                                                // // set delegates
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var niceArray = ["Helpful Robots", "Some Humans"]   // // set 1st array and fill it
    var naughtyArray = ["Invading Alien", "Jaws", "Killer Robots"]  // // set 2nd array and fill it
    
    let tabBarC = UITabBarController()  // // set globally for functions
    
    // // global alloc and init for addList items
    let listNameField = UITextField(frame: CGRectMake(10, 10, UIScreen.mainScreen().bounds.size.width - 40, 40))
    let listOption = UISegmentedControl(frame: CGRectMake(10, 60, UIScreen.mainScreen().bounds.size.width - 20, 40))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // // tabBarController added here
        self.view.addSubview(tabBarC.view)
        self.addChildViewController(tabBarC)
        
        let niceList = UITableViewController()  // // 1st TVC for 1st list
        niceList.title = "Nice"
        niceList.tableView.dataSource = self
        niceList.tableView.delegate = self
        niceList.tableView.tag = 0
        niceList.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        niceList.tabBarItem.image = UIImage(named: "nice")
        
        
        let naughtyList = UITableViewController()       // // 2nd TVC for 2nd list
        naughtyList.title = "Naughty"
        naughtyList.tableView.dataSource = self
        naughtyList.tableView.delegate = self
        naughtyList.tableView.tag = 1
        naughtyList.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        naughtyList.tabBarItem.image = UIImage (named: "naughty")
        
        
        
        let addToList = UIViewController()      // // VC for addList
        addToList.title = "Add To List"
        

        listNameField.layer.cornerRadius = 10
        listNameField.backgroundColor = UIColor.lightGrayColor()
        addToList.view.addSubview(listNameField)
        
        
        listOption.tintColor = UIColor.lightGrayColor()
//        listOption.setValue(0, forKey: "Nice")
//        listOption.setValue(1, forKey: "Naughty")
        listOption.insertSegmentWithTitle("Nice", atIndex: 0, animated: true)
        listOption.insertSegmentWithTitle("Naughty", atIndex: 1, animated: true)
        
        addToList.view.addSubview(listOption)
        
        let addButton = UIButton(frame: CGRectMake(10, 110, UIScreen.mainScreen().bounds.size.width - 20, 40))
        addButton.backgroundColor = addButton.tintColor
        addButton.tintColor = UIColor.whiteColor()
        addButton.setTitle("Add New Item", forState: .Normal)
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action:Selector("addNewItem"), forControlEvents: UIControlEvents.TouchUpInside)
        addToList.view.addSubview(addButton)
        
        
        tabBarC.viewControllers = [niceList, naughtyList, addToList]
        
    }
    
    func addNewItem()
    {
//        var itemArray = (Bool(listOption.selectedSegmentIndex)) ? naughtyArray : niceArray
//        itemArray += [listNameField.text]
        
        switch(listOption.selectedSegmentIndex) {
            
 //       case 0: niceArray.append(listNameField.text)
            
        case 0: niceArray += [listNameField.text]
        
        case 1: naughtyArray.append(listNameField.text)
        
        default :
            print("bad")
        }
        
        listNameField.text = ""
        listNameField.resignFirstResponder()
        
        (tabBarC.viewControllers[listOption.selectedSegmentIndex] as UITableViewController).tableView.reloadData()

    }


    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return (Bool(tableView.tag)) ? naughtyArray.count : niceArray.count
        }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let itemArray = (Bool(tableView.tag)) ? naughtyArray : niceArray
        
        cell.textLabel.text = itemArray[indexPath.row]
        
        
        return cell
    }

}

