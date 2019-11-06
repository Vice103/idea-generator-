//
//  CardsViewController.swift
//  IdeaGenerator2
//
//  Created by CCT on 5/11/19.
//  Copyright © 2019 SwiftGroup102019. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var cardButton1: UIButton!
    @IBOutlet weak var cardButton2: UIButton!
    @IBOutlet weak var cardButton3: UIButton!
    @IBOutlet weak var nextButton3: UIButton!
    var category: String!
    var combinations: [String] = ["", "", ""]
    var words: [String] = ["", "", ""]
    var scifiWords: [String:[String]] = ["Adverb":["apocalyptic","mind-bending","galactic:","gravitationally","virtually"],"Verb":["teleport","magnetise","time-travelling","hovering","nuclearising"],"Noun":["aliens","android","robots","vortex","machine","electricity"],"Adjective":["futuristic","steam-powered","scientific","metallic","atomic","technological"],"Preposition":["into", "in front of","in place of","prior to","round","off","on","throughout","about","above","after"],"Location":["spaceship","galaxy","virtual reality","alternate universe","interplanetary"]]
    var fantasyWords: [String:[String]] = ["Adverb":["mischievous","magically","peculiarly","transformative","viciously"],"Verb":["enchant","curse","heal","chant","revive","entrance"],"Noun":["dragons","pegasus","cauldron","potion","elves","giants","familiar","pirates","goblin","sorcerer","necromancer","ritual"],"Adjective":["rural","overgrown","evil","malevolent","benevolent","idyllic"],"Preposition":["into", "in front of","in place of","prior to","round","off","on","throughout","about","above","after"],"Location":[" castle","hut","under the sea","burrow","cave","tower"]]
    var horrorWords: [String:[String]] = ["Adverb":["suddenly","quickly","creepily","silently","carefully"],"Verb":["slam","howl","growl","sprint","cackled","spooked","cracked"],"Noun":["ghosts","zombie","blood stains","draft","bat"],"Adjective":["slimy","haunted","abandoned","cold","deprived","weathered","matted"],"Preposition":["into", "in front of","in place of","prior to","round","off","on","throughout","about","above","after"],"Location":["basement","hotel","cabin","mansion","forest"]]
    
    var mysteryWords: [String:[String]] = ["Adverb":["suspiciously","reasonably","discreetly","murderously","efficiently","deceptively"],"Verb":["suspect","freeze","explain","search","questioned","knived"],"Noun":["pistol","body","crime","evidence","reasoning","mental health"],"Adjective":["mutilated","suicidal", "hidden", "secret","criminal"],"Preposition":["into", "in front of","in place of","prior to","round","off","on","throughout","about","above","after"],"Location":["hide out","headquarters","sack","crime scene","sewer","mental institution"]]
    
    func pickRandomWord(category: String, type: String) -> String {
        var word = ""
        var wordsOfCategory: [String] = []
        switch category {
        case "Sci-Fi":
            wordsOfCategory = scifiWords[type]!
            let randomIndex = arc4random_uniform(UInt32(wordsOfCategory.count))
            word = wordsOfCategory[Int(randomIndex)]
            
        case "Fantasy":
            wordsOfCategory = fantasyWords[type]!
            let randomIndex = arc4random_uniform(UInt32(wordsOfCategory.count))
            word = wordsOfCategory[Int(randomIndex)]
        case "Horror":
            wordsOfCategory = horrorWords[type]!
            let randomIndex = arc4random_uniform(UInt32(wordsOfCategory.count))
            word = wordsOfCategory[Int(randomIndex)]
            
        case "Mystery":
        wordsOfCategory = mysteryWords[type]!
        let randomIndex = arc4random_uniform(UInt32(wordsOfCategory.count))
        word = wordsOfCategory[Int(randomIndex)]
        default:
            break
        }
        return word
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        for i in 0..<3 {
            words[i] = pickRandomWord(category: category, type: combinations[i])
        }
        
        if sender.accessibilityIdentifier == "cardButton1" {
            sender.setTitle(words[0], for: .normal)
        } else if sender.accessibilityIdentifier == "cardButton2" {
            sender.setTitle(words[1], for: .normal)
        } else {
            sender.setTitle(words[2], for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cardButton1.titleLabel?.numberOfLines = 0
        cardButton2.titleLabel?.numberOfLines = 0
        cardButton3.titleLabel?.numberOfLines = 0
        // Do any additional setup after loading the view.
        nextButton3.layer.cornerRadius = 12
        nextButton3.layer.shadowOffset = CGSize(width: 5, height: 10)
        nextButton3.layer.shadowOpacity = 0.2
        for i in 0..<3 {
            words[i] = pickRandomWord(category: category, type: combinations[i])
        }
        nextButton3.isHidden = true
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
