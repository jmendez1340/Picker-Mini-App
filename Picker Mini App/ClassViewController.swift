//
//  ClassViewController.swift
//  Picker Mini App
//
//  Created by Jason on 2/26/17.
//  Copyright © 2017 Jason Mendez. All rights reserved.
//

import UIKit
import AVFoundation

class ClassViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

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
    
    
    @IBOutlet weak var classPicker: UIPickerView!
    private let classNames = ["Mercenary","Mrymidon","Cavalier","Pirate","Armor Knight","Pegasus Knight","Bishop","Priestess","Wyvern Rider","Archer","Mage", "Dragon","Lord","Fighter","Villager"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do
        {
            let audioPath = Bundle.main.path(forResource: "208 Village Girl", ofType: "mp3")
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
        let row = classPicker.selectedRow(inComponent: 0)
        let selected = classNames[row]
        let title = "You chose to be a \(selected)."
        
        let alert = UIAlertController(title: title, message: "Congrats on your pick!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    // MARK: - 
    // MARK: Picker Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classNames.count
    }
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classNames[row]
    }
    
    
}
