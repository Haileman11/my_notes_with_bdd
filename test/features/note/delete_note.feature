Feature: Delete note

    As a User,
    I should be able to delete note
    # so that I can view them later.    
    Background: Setup injection
        Given injection is setup
    After: 
        Then clean up after the test
    Rule: I can delete notes 
        Scenario: Should see a confirmation dialog when delete is pressed
            Given The saved notes list is not empty
            And The app is on {'/notes/note'} page            
            When I tap {Icons.delete} icon
            Then I see {AlertDialog} widget