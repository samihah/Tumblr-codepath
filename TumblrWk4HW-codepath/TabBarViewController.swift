//
//  TabBarViewController.swift
//  TumblrWk4HW-codepath
//
//  Created by Samihah Azim on 11/5/16.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    //var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "homeVC")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "searchVC")
        //composeViewController = storyboard.instantiateViewController(withIdentifier: "composeVC")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "accountVC")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "trendingVC")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        buttons[selectedIndex].isSelected = true
        tabBarBtns(buttons[selectedIndex])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tabBarBtns(_ sender: UIButton) {
        //contentView = homeViewController.view
       let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
