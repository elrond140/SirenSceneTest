//
//  SceneDelegateSirenExtension.swift
//  SirenSceneTest

//
//  SceneDelegateSirenExtension.swift
//  SirenTest
//

import Siren

extension SceneDelegate{
   
    func SirenCustomAlertRules() {
        let siren = Siren.shared
        // The key for using custom alerts is to set the `alertType` to `.none`.
        // The `Results` type will return localized strings for your app's custom modal presentation.
        // The `promptFrequency` allows you to customize how often Siren performs the version check before returning a non-error result back into your app, prompting your custom alert functionality.
        let rules = Rules(promptFrequency: .immediately, forAlertType: .none)
        siren.rulesManager = RulesManager(globalRules: rules)
        print("SirenCustomAlertRules() Called")
        
        siren.wail { results in
            print("Siren.Wail results: ")
            switch results {
            case .success(let updateResults):
                print("AlertAction ", updateResults.alertAction)
                print("Localization ", updateResults.localization)
                print("Model ", updateResults.model)
                print("UpdateType ", updateResults.updateType)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}


