({
    handleClick: function(component, event, helper) {
        let btnClicked = event.getSource();         // the button
        let btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.message", btnMessage);     // update our message
    },
    
    handleClick2: function(component, event, helper) {
        let newMessage = event.getSource().get("v.label");
        component.set("v.message", newMessage);		// same use as handleClick 
    },
    
    handleClick3: function(component, event, helper) {
        component.set("v.message", event.getSource().get("v.label"));
        											// same use as handleClick & handleClick2
    },
    
        handleClick4: function(component, event, helper) {
        let newMessage = event.getSource().get("v.label");
        console.log("handleClick4: Message: " + newMessage); // inspect browser to meg in console
        component.set("v.message", newMessage);
    },
})