# Shopping List
iOS Core Data App

Mobile Multimedia Assignment2 - iPhone Core Data App

Xinyu Miao

This App is like a shopping memo for user to remember what they need to buy before they go to the supermarket and when they have put something from the list in their trolley, they can tick the item and the item will disappear in the current shopping list and show in history list.

In this asssignment, I developed an iPhone CoreData App for shopping. This application have two entities, one is ItemEntity and the other is HistoryEntity. ItemEntity has four attributes title(String), imageName(String), price(Double) and quantity(Int). HistoryEntity has one attribute which is perchased(Boolean).

In order to impletment the history functionality, I created two Arrays based on ItemEntity and the purchased attribute is a boolean value for each item to choose which array it should be in. Then, the ItemsView is showing the items which are new and the HistoryView is showing the items which are purchased. In addition, if user made a mistake, he can click the item in the History List and the specific item will be back to the Item List.

In item list view, the users can see all the item they need to buy in the supermarket and if they don’t want buy something in the list, they can swipe left to delete it. If they have put something from the list in their trolley, they can tick the item and the item will disappear in the current shopping list and show in history list.

In add and update view, there is a picker for users to choose the item type and if they add a new item, the item type will transfer to the corresponding image showing on the item View.

In order to test the functionality easily, I create 5 initail data stored in core data context and 3 for items view, 2 for history view. All of the initial data and user added data can be updated and deleted. In addtion, the total price of user will spend or have spent will be show real time underneath the items view and history view. The console will print the route for the Shopping_List.sqlite database when running so that it is easy to see the data storage vividly.

Above is a brief introduction of my assginment, the detail coding is in my Shopping List swift project.
