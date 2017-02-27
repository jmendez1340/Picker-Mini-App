//
//  GamesViewController.swift
//  Picker Mini App
//
//  Created by Jason on 2/26/17.
//  Copyright © 2017 Jason Mendez. All rights reserved.
//

import UIKit
import AVFoundation

class GamesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func Play(_ sender: UIButton) {
        player.play()
    }
    
    
    @IBAction func Pause(_ sender: UIButton) {
        player.pause()
    }
    
    
    @IBAction func Replay(_ sender: UIButton) {
        player.currentTime = 0
    }
    
    
    @IBOutlet weak var favoritePicker: UIPickerView!
    private let gameComponent = 0
    private let characterComponent = 1
    
    
    private let gameTypes = [
        "Dark Dragon and Sword of Light","Gaiden", "Mystery Of The Emblem", "Genealogy of the Holy War", "Thracia 776", "Binding Blade"," Blazing Blade", "The Sacred Stones", "Path of Radiance", "Radiant Dawn", "Shadow Dragon", "New Mystery Of The Emblem", "Awakening", "Fates"]
    private let characterTypes = ["Marth","Alm","Sigurd","Seliph","Eldigan","Leif","Finn","Roy","Zephiel","Lilina","Idoun","Cecilia","Perceval","Lyndis","Hector","Eliwood","Ike","Mia","Lissa","Cynthia","Cordelia","Sumia","Severa","Hana","Ophelia","Sophia"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do
        {
            let audioPath = Bundle.main.path(forResource: "02 Fire Emblem Theme", ofType: "mp3")
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
        let gameRow = favoritePicker.selectedRow(inComponent: gameComponent)
        let characterRow = favoritePicker.selectedRow(inComponent: characterComponent)
        
        let game = gameTypes[gameRow]
        let character = characterTypes[characterRow]
        let message = "Your favorite game is \(game) and your favorite character is \(character)"
        
        let alert = UIAlertController(title: "Great choices!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == characterComponent {
            return characterTypes.count
        } else {
            return gameTypes.count
        }
    }
    
    // MARK: -
    // MARK: Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == characterComponent{
            return characterTypes[row]
        } else{
            return gameTypes[row]
        }
    }
    
    
    
    
    
    
}
