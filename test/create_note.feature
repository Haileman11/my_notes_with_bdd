Feature: Create Note

    As a User,
    I should be able to create note
    so that I can view them later.
    Background: Setup injection
        Given injection is setup
    After: Tear down injection
        Then clean up after the test
    
    Rule: I can create note when title is not empty
    
        # Scenario: Should navigate to new note page when add button is pressed
        #     Given the app is running
        #     And I see {'Notes'} text
        #     When I tap {Icons.add} icon                    
        #     Then I see {'Add new note'} text
        # should be changed to two text fields
        Scenario: Should show a success message when given valid title            
            Given The database saves the note
            And The app is on {'/notes/new_note'} page                   
            When I enter {"Shopping list"} into {0} input field
            And I enter {"battery, groceries"} into {1} input field
            And I tap {Icons.save} icon
            Then I see {SnackBar} widget
            And I see {'Saved successfully'} text
        
        Scenario: Should display error when title is empty                                    
            Given The app is on {'/notes/new_note'} page
            When I enter {""} into {0} input field
            And I enter {"battery, groceries"} into {1} input field
            And I tap {Icons.save} icon
            Then I see {'Title can not be empty'} text