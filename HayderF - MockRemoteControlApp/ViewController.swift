//
//  ViewController.swift
//  HayderF - MockRemoteControlApp
//
//  Created by Farhaj on 2/20/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var TVPowerStatus: UILabel!
    @IBOutlet weak var VolumeStatus: UILabel!
    @IBOutlet weak var ChannelStatus: UILabel!
    @IBOutlet weak var ButtonZero: UIButton!
    @IBOutlet weak var ButtonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    @IBOutlet weak var ButtonFour: UIButton!
    @IBOutlet weak var ButtonFive: UIButton!
    @IBOutlet weak var ButtonSix: UIButton!
    @IBOutlet weak var ButtonSeven: UIButton!
    @IBOutlet weak var ButtonEight: UIButton!
    @IBOutlet weak var ButtonNine: UIButton!
    @IBOutlet weak var ChannelUpButton: UIButton!
    @IBOutlet weak var ChannelDownButton: UIButton!
    @IBOutlet weak var PowerSwitch: UISwitch!
    @IBOutlet weak var VolumeSlider: UISlider!
    @IBOutlet weak var FavoriteChannelSegControl: UISegmentedControl!
    var numsArray = [String]()
    
    @IBAction func PowerSwitchFunc(_ sender: UISwitch) {
        PowerSwitch.setOn(sender.isOn, animated: true)
        TVPowerStatus.text = (sender.isOn ? "On" : "Off")
        if sender.isOn == true {
            TVPowerStatus.text = "On"
            VolumeSlider.isEnabled = true
            ChannelUpButton.isEnabled = true
            ChannelDownButton.isEnabled = true
            FavoriteChannelSegControl.isEnabled = true
            ButtonZero.isEnabled = true
            ButtonOne.isEnabled = true
            ButtonTwo.isEnabled = true
            ButtonThree.isEnabled = true
            ButtonFour.isEnabled = true
            ButtonFive.isEnabled = true
            ButtonSix.isEnabled = true
            ButtonSeven.isEnabled = true
            ButtonEight.isEnabled = true
            ButtonNine.isEnabled = true
            
        }
        else {
            TVPowerStatus.text = "Off"
            VolumeSlider.isEnabled = false
            ChannelUpButton.isEnabled = false
            ChannelDownButton.isEnabled = false
            FavoriteChannelSegControl.isEnabled = false
            ButtonZero.isEnabled = false
            ButtonOne.isEnabled = false
            ButtonTwo.isEnabled = false
            ButtonThree.isEnabled = false
            ButtonFour.isEnabled = false
            ButtonFive.isEnabled = false
            ButtonSix.isEnabled = false
            ButtonSeven.isEnabled = false
            ButtonEight.isEnabled = false
            ButtonNine.isEnabled = false
        }
    }
    
    @IBAction func VolumeSliderFunc(_ sender: UISlider) {
        VolumeStatus.text = "\(Int(sender.value))"
    }
    
    @IBAction func ChannelButtonsFunc(_ sender: UIButton) {
        let numButton: String = sender.currentTitle!
        if numsArray.count == 0 || numsArray.count == 1 {numsArray.append(numButton)}
        if numsArray.count == 2 {
            let channel = numsArray[0] + numsArray[1]
            if channel == "00" {numsArray.removeAll()}
            else {
                ChannelStatus.text = channel
                numsArray.removeAll()
            }
        }
    }

    @IBAction func ChannelUpFunc(_ sender: UIButton) {
        let num = Int(ChannelStatus.text!)
        if num! + 1 > 99 {}
        else {
            let incrementNum = num! + 1
            ChannelStatus.text = "\(incrementNum)"
        }
    }
    
    @IBAction func ChannelDownFunc(_ sender: UIButton) {
        let num = Int(ChannelStatus.text!)
        if num! - 1 < 1 {}
        else {
            let decrementNum = num! - 1
            ChannelStatus.text = "\(decrementNum)"
        }
    }

}
