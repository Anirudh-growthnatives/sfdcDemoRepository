({
	createExpense: function(component,expense) {
        let theExpenses = component.get("v.expenses");
        //Copy the expense to a new object 
        //THIS IS A DISGUSTING, TEMPORARY HACK
        let newExpense = JSON.parse(JSON.stringify(expense));
        thisExpense.push(newExpense);
        component.set("v.expenses", theExpenses);		
	}
})