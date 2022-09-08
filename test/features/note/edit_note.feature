Feature: Edit Note
    As a user, 
    I want to be able to edit an existing note 
    so that I can make changes to the note I saved before.
    Background: Setup injection
        Given injection is setup
    After: Tear down injection
        Then clean up after the test
    Rule: I can make changes to an existing note if new title is valid
        Scenario: Should be able to edit note when title is valid
            Given The database saves the note
            And The app is on {'/notes/note'} page
            And I see {'Edit note'} text
            When I enter {"Shopping list"} into {0} input field
            And I enter {"battery, groceries"} into {1} input field
            And I tap {Icons.save} icon
            Then I see {SnackBar} widget
            And I see {'Saved successfully'} text
        Scenario: Should not make changes to the new note if title is empty
            Given The app is on {'/notes/note'} page
            And I see {'Edit note'} text          
            When I enter {""} into {0} input field
            And I tap {Icons.save} icon
            Then I see {'Title can not be empty'} text