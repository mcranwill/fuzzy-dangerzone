fuzzy-dangerzone
================
Mike Cranwill

CS-705 : Mobile App Development on the iPhone.  

Tasks for Phase 1 of the class

    Task 3
    The application allows users to add and remove tasks as they accomplish them.
    
    A high level description of how I replicated the functionality of the app
        
                Step 1: Adding Elements
        I started by implementing adding elements from an external add screen
        which accepts user text input.  The add screen then pushes the text
        to the data controller which creates a new instance of the TaskObj class
        in the middle of a 'done' segue.
        The TaskObj instance is then pushed to the master list of TaskObjs and the
        tableView is then reloaded.
                Step 2: Deleting Elements
        Next, I enabled editing of elements using the built in editButtonItem's
        functionality.  In the dataController, I implemented a removeObjectAtIndex 
        method which made it possible to access and update the master list of 
        TaskObjs. Using the commitEditingStyle method, I deleted the appropriate
        objects from both the master list and the tableView if the proper
        editingStyle (UITableViewCellEditingStyleDelete) was specified.
                Step 3: Changing the Style of Elements
        My next logical step was to be able to change the look of the elements in
        the Master View List.  So I switched the references in the TaskObj from
        NSString to NSAttributedString which as of iOS 6 supports strikethrough,
        text color, and underline natively.  I found this on a few stackOverflow
        posts as I was searching for how to deal with other problems that arose.
                Step 4: Persistent Storage
        I used an NSKeyedArchiver to write the master list of TaskObjs to a file.
        Then with an NSKeyedUnarchiver, I decoded the file and wrote the data
        to a new Master list.
    
    Task 2
    The application allows users to view and add to a list of bird sightings that
    they have witnessed.  The application demonstrates creating a new model 
    layer which then is utilized as a class.  The class allows the application to
    create BirdSighting objects and pass them around the application as necessary.
    
    Task Question: Explain one concept that you learned from doing the tutorial.
    
    An example of a concept I learned from doing the tutorial was the difference 
    between dynamic prototypes and static cells.  Dynamic prototypes are good when
    you do not know how many cells you will need, but do know the exact template you
    want all of them to have.  In contrast, static cells must be pre-designed which 
    offers more flexibility early.  Static cells are very good for lists or option
    menus that do not change.

    Task 1

    The application allows user input to be accepted by a text field and displayed
    in a label. The input is gathered either by the pressing of a submit/'Hello' 
    button or the 'done' button on the keyboard.

    Task Question: The tutorial says to send the resignFirstResponder message to  
    theTextField in order to dismiss the keyboard, but the way it is describe this 
    seems like a side-effect of that action. What is the main purpose of the 
    resignFirstResponder message?

    The main purpose of the resignFirstResponder is to re-assign which element
    possesses the first responder status and has the focus of the application.
    An Example:
        In our application, we re-assign the first response element, the textField,
        so we can dismiss the keyboard and update the label.
