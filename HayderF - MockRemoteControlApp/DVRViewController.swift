//
//  DVRViewController.swift
//  HayderF - MockRemoteControlAppII
//
//  Created by Farhaj on 3/2/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var DVRPowerStatus: UILabel!
    @IBOutlet weak var DVRStateStatus: UILabel!
    @IBOutlet weak var PowerSwitch: UISwitch!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    @IBOutlet weak var FastForwardButton: UIButton!
    @IBOutlet weak var FastRewindButton: UIButton!
    @IBOutlet weak var RecordButton: UIButton!
    var PlayButtonProgressStatus = false
    var StopButtonProgressStatus = true
    var PauseButtonProgressStatus = false
    var FastForwardButtonProgressStatus = false
    var FastRewindButtonProgressStatus = false
    var RecordButtonProgressStatus = false
    
    @IBAction func PowerSwitchFunc(_ sender: UISwitch) {
        DVRPowerStatus.text = (sender.isOn ? "On" : "Off")
        PowerSwitch.setOn(sender.isOn, animated: true)
        if sender.isOn == true {
            DVRPowerStatus.text = "On"
            PlayButton.isEnabled = true
            StopButton.isEnabled = true
            PauseButton.isEnabled = true
            FastForwardButton.isEnabled = true
            FastRewindButton.isEnabled = true
            RecordButton.isEnabled = true
        }
        else {
            DVRPowerStatus.text = "Off"
            PlayButton.isEnabled = false
            StopButton.isEnabled = false
            PauseButton.isEnabled = false
            FastForwardButton.isEnabled = false
            FastRewindButton.isEnabled = false
            RecordButton.isEnabled = false
        }
    }
    
    @IBAction func PlayButtonFunc(_ sender: UIButton) {
        if RecordButtonProgressStatus == false {
            DVRStateStatus.text = "Playing"
            PlayButtonProgressStatus = true
            StopButtonProgressStatus = false
        }
        else {
            let dvrtitle = "Warning"
            let dvrmessage = "Cannot play while recording"
            let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
            let cancelActionHandler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            func forcePlayHandler(alert: UIAlertAction!) {
                DVRStateStatus.text = "Playimg"
                let dvrtitle = "Alert"
                let dvrmessage = "The current operation has been stopped and the requested operation will proceed"
                let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
                let okActionHandler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                uiAlertController.addAction(okActionHandler)
                present(uiAlertController, animated: true, completion: nil)
            }
            let forceConfirmHandler = UIAlertAction(title: "Force Play", style: .default, handler: forcePlayHandler)
            uiAlertController.addAction(cancelActionHandler)
            uiAlertController.addAction(forceConfirmHandler)
            if PlayButtonProgressStatus == false {
                present(uiAlertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func StopButtonFunc(_ sender: UIButton) {
        DVRStateStatus.text = "Stopped"
        StopButtonProgressStatus = true
        RecordButtonProgressStatus = false
    }
    
    @IBAction func PauseButtonFunc(_ sender: UIButton) {
        if PlayButtonProgressStatus == true && StopButtonProgressStatus == false {
            DVRStateStatus.text = "Paused"
            PauseButtonProgressStatus = false
        }
        else {
            let dvrtitle = "Warning"
            let dvrmessage = "Cannot pause while stopped or recording"
            let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
            let cancelActionHandler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            func forcePauseHandler(alert: UIAlertAction!) {
                DVRStateStatus.text = "Paused"
                PlayButtonProgressStatus = true
                StopButtonProgressStatus = false
                let dvrtitle = "Alert"
                let dvrmessage = "The current operation has stopped and the requested operation will proceed"
                let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
                let okActionHandler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                uiAlertController.addAction(okActionHandler)
                present(uiAlertController, animated: true, completion: nil)
            }
            let forceConfirmHandler = UIAlertAction(title: "Force Pause", style: .default, handler: forcePauseHandler)
            uiAlertController.addAction(cancelActionHandler)
            uiAlertController.addAction(forceConfirmHandler)
            if PauseButtonProgressStatus == false { present(uiAlertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func FastForwardFunc(_ sender: UIButton) {
        if PlayButtonProgressStatus == true && StopButtonProgressStatus == false {
            DVRStateStatus.text = "Fast Forwarding"
            StopButtonProgressStatus = false
            FastForwardButtonProgressStatus = false
        }
        else {
            let dvrtitle = "Warning"
            let dvrmessage = "Cannot fast forward while stopped or recording"
            let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
            let cancelActionHandler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            func forceFastForwardHandler(alert:UIAlertAction!) {
                DVRStateStatus.text = "Fast Forwarding"
                PlayButtonProgressStatus = true
                StopButtonProgressStatus = false
                let dvrtitle = "Alert"
                let dvrmessage = "The current operation has stopped and the requested operation will proceed"
                let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
                let okActionHandler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                uiAlertController.addAction(okActionHandler)
                present(uiAlertController, animated: true, completion: nil)
            }
            let forceConfirmHandler = UIAlertAction(title: "Force Fast Forward", style: .default, handler: forceFastForwardHandler)
            uiAlertController.addAction(cancelActionHandler)
            uiAlertController.addAction(forceConfirmHandler)
            if FastForwardButtonProgressStatus == false { present(uiAlertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func FastRewindFunc(_ sender: UIButton) {
        if PlayButtonProgressStatus == true && StopButtonProgressStatus == false {
            DVRStateStatus.text = "Fast Rewinding"
            StopButtonProgressStatus = false
            FastRewindButtonProgressStatus = false
        }
        else {
            let dvrtitle = "Warning"
            let dvrmessage = "Cannot fast rewind while stopped or recording"
            let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
            let cancelActionHandler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            func forceFastRewindHandler(alert: UIAlertAction!) {
                DVRStateStatus.text = "Fast Rewinding"
                PlayButtonProgressStatus = true
                StopButtonProgressStatus = false
                let dvrtitle = "Alert"
                let dvrmessage = "The current operation has stopped and the requested operation will proceed"
                let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
                let okActionHandler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                uiAlertController.addAction(okActionHandler)
                present(uiAlertController, animated: true, completion: nil)
            }
            let forceConfirmHandler = UIAlertAction(title: "Force Fast Rewind", style: .default, handler: forceFastRewindHandler)
            uiAlertController.addAction(cancelActionHandler)
            uiAlertController.addAction(forceConfirmHandler)
            if FastRewindButtonProgressStatus == false {
                present(uiAlertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func RecordButtonFunc(_ sender: UIButton) {
        if StopButtonProgressStatus == true {
            DVRStateStatus.text = "Recording"
            RecordButtonProgressStatus = false
        }
        else {
            let dvrtitle = "Warning"
            let dvrmessage = "Cannot record if DVR is in a non-stopped state"
            let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
            let cancelActionHandler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            func forceRecordHandler(alert:UIAlertAction!) {
                DVRStateStatus.text = "Record"
                StopButtonProgressStatus = true
                let dvrtitle = "Alert"
                let dvrmessage = "The current operation has stopped and the requested operation will proceed"
                let uiAlertController = UIAlertController(title: dvrtitle, message: dvrmessage, preferredStyle: .alert)
                let okActionHandler = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                uiAlertController.addAction(okActionHandler)
                present(uiAlertController, animated: true, completion: nil)
            }
            let forceConfirmHandler = UIAlertAction(title: "Force Recording", style: .default, handler: forceRecordHandler)
            uiAlertController.addAction(cancelActionHandler)
            uiAlertController.addAction(forceConfirmHandler)
            if RecordButtonProgressStatus == false {
                present(uiAlertController, animated: true, completion: nil)
            }
        }
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
