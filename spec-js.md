# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show page rendered using jQuery and an Active Model Serialization JSON backend. (Both stone and design show pages render using jQuery and AMS JSON - a user can click to the previous or next design/stone, and that design/stone's details will appear without a page refresh)
- [x] Include an index page rendered using jQuery and an Active Model Serialization JSON backend. (The home page has headers for Stones and Users - when clicked, each stone and user respectively will be added to the page in a list, without a page refresh)
- [x] Include at least one has_many relationship in information rendered via JSON (if a stone is used in any designs, those designs will appear in the stone's show page. A stone has many designs, a design belongs to a stone)
- [x] Include at least one link that loads or updates a resource without reloading the page (when creating a stone, the newly created stone will appear on the page without a page refresh)
- [x] Translate JSON responses into js model objects (when creating a new stone, after posting to '/stones', the response is converted into a JSON Stone object, which then calls on its createHTML function to render the Stone's info on the page)
- [x] At least one of the js model objects must have at least one method added by your code to the prototype (when creating a new stone, after posting to '/stones', the response is converted into a JSON Stone object, which then calls on its createHTML function to render the Stone's info on the page. The createHTML function is a prototype method)

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
