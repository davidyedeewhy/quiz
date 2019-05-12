# Start up flow

`Quiz.storyboard` is specified in `Info.plist` to be displayed on launch.

# Basic Structure

- `Quiz`
- `Launch` 
- `Modules`
- Specific Modules e.g. `Quiz`
- `Controller` - All ViewControllers and Storyboard will be under `Controller`.
- `View` - All dependent views will be here.
- `Model` - All related models will be here.

# Quiz Rules

- `LandingViewController` - display score 
- `QuestionViewController` - display questions and result after user choose answer 
- `Score` - every question values 20 score
