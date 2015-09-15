//
//  ViewController.swift
//  defaults-local-save
//
//  Created by Jonathan Wood on 9/14/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var people = [Person]()
    
    @IBOutlet weak var favLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLabel.text = "Favorite Color: \(color)"
        } else {
            favLabel.text = "Pick a color!"
        }
        
        
        // Creating and adding people to array people
        let personA = Person(first: "Wing", last: "Chung")
        let personB = Person(first: "John", last: "Bytheway")
        let personC = Person(first: "Stephen", last: "Covey")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        // convert object to data (converting people array)
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        // set regular object to NSUserDefaults (if string, int, bool, double
        // don't need to archive (and encode)
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
            NSUserDefaults.standardUserDefaults().synchronize()
    }


    @IBAction func red(sender: AnyObject) {
        favLabel.text = "Favorite Color: Red"
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
            NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func yellow(sender: AnyObject) {
        favLabel.text = "Favorite Color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
            NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blue(sender: AnyObject) {
        favLabel.text = "Favorite Color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
            NSUserDefaults.standardUserDefaults().synchronize()
        
        // want to load data: grab out from NSUserDefaults
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            // unarchive it into the object that it used to be [Person] 
            // i.e. (array of type Person)
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                    print(person.firstName)
                }
                
            }
            
        }
    }
    
    
}

