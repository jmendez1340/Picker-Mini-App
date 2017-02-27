//
//  MarriageViewController.swift
//  Picker Mini App
//
//  Created by Jason on 2/26/17.
//  Copyright © 2017 Jason Mendez. All rights reserved.
//

import UIKit
import AVFoundation

class MarriageViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func Play(_ sender: UIButton) {
        player.play()
    }
    
    
    @IBAction func Pause(_ sender: UIButton) {
        player.stop()
    }
    
    
    @IBAction func Replay(_ sender: UIButton) {
        player.currentTime = 0
    }
    
    
    @IBOutlet weak var marriagePicker: UIPickerView!
    private let firstComponent = 0
    private let secondComponent = 1
    private let firstTypes = ["Marth","Roy","Sigurd","Seliph","Finn","Eliwood","Hector","Ike","Chrom","Robin"]
    private let secondTypes = [ "Caeda","Lilina","Deirdre","Tinny","Lachesis","Ninian","Lyndis","Elincia","Sumia","Cordelia"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "13 Beloved One", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //Error
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let firstRow = marriagePicker.selectedRow(inComponent: firstComponent)
        let secondRow = marriagePicker.selectedRow(inComponent: secondComponent)
        
        let first = firstTypes[firstRow]
        let second = secondTypes[secondRow]
        let message = "You chose to pair up \(first) and \(second)."
        
        let alert = UIAlertController(title: "Thank you for choosing", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Great", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Picker Data Source Method
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == secondComponent {
            return secondTypes.count
        } else {
            return firstTypes.count
        }
    }
    
    // MARK: Picker Delegate Method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == secondComponent{
            return secondTypes[row]
        } else {
            return firstTypes[row]
        }
    }

}
