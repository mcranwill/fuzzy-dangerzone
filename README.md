fuzzy-dangerzone
================
Mike Cranwill

CS-705 : Mobile App Development on the iPhone.  Tasks for Phase 1 of the class

Task Question: The tutorial says to send the resignFirstResponder message to  
theTextField in order to dismiss the keyboard, but the way it is describe this 
seems like a side-effect of that action. What is the main purpose of the 
resignFirstResponder message?

The main purpose of the resignFirstResponder is to re-assign which element
possesses the first responder status and has the focus of the application.
An Example:
    In our application, we re-assign the first response element, the textField,
    so we can dismiss the keyboard and update the label.
