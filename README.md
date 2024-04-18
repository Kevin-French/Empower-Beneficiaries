# Beneficiaries

Here is my code for the take-home project.  I am happy with my solution but would add more tests if I had more time.

I used MVVM, the Factory pattern and DI to try to keep the project well-structured and to have better separation of concerns.

I tried to keep the UI simple while sticking to iOS conventions.

### HOW TO RUN
- The app and tests can both be ran using standard methods.

### AREAS FOR IMPROVEMENT
- I would have liked to have used the standard `UICollectionViewController` class for both view controllers as they are very similar but I ran into an issue with the data for the first view controller not loading when using a diffable data source.  I ran out of time so I discarded those changes and went back to the working solution I already had.
- I prefer to use initializer injection whenever possible so I would have liked to do so with the View Controllers but I couldn't find a way to do that because the view models used the collection views in their initializers.
- Given more time, I would add more testing.

### SPECS

Duration:

Candidate is expected to submit complete the exercise in approximately 24 hours. 

Requirements: 

Create a native iOS app to provide information on an account holder's beneficiaries.

Display a list of beneficiaries using data from the attached json file. Each row should display the firstName, lastName, beneType and designation. A "P" designationCode translates to "Primary" designation and "C" translates to "Contingent" designation.
Selecting a beneficiary should show additional information about them - SSN, date of birth, phone number and address. Date of birth is provided in the format "MM/dd/yyyy".
What is important:

Well-constructed, easy to follow, commented code. 
Proper separation of concerns and best-practice coding patterns. 
Deserialization of model objects from JSON using Swift Codable or NSJSONSerialization.
Your app project is provided as a zip and can run in the iOS simulator.
Things to keep in mind:

Avoid using CocoaPods or any third-party dependency.
Be sure to use safe area insets and that the app is compatible with iPhones with rounded corners/notch.
Feel free to use Swift/Objective C as the primary language. 
Please use UIKit, not Swift UI.
