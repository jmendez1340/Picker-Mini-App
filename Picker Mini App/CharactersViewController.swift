//
//  CharactersViewController.swift
//  Picker Mini App
//
//  Created by Jason on 2/26/17.
//  Copyright © 2017 Jason Mendez. All rights reserved.
//

import UIKit
import AVFoundation

class CharactersViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

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
    
    @IBOutlet weak var friendPicker: UIPickerView!
    private let characterNames = ["Palla", "Catria","Minerva","Est","Clarine","Shanna","Lex","Alec","Johan","Azel","Sain","Rebecca","Fiora","Lyon","Serra","Kyle"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do
        {
            let audioPath = Bundle.main.path(forResource: "48 Join Us!- Event", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //error
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
        let row = friendPicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "You Selected \(selected)"
        
        let alert = UIAlertController(title: title, message: "Your best friend is \(selected)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Hooray!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    // MARK: Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }
    
    
    
    
    
    
    
    
    
    
    
}
