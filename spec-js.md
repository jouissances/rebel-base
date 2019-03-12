# Specifications for the Rails with JavaScript Assessment

[x] Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.
    <!-- For example: in a blog domain with users and posts, you might display the index of the user's posts on the users show page, fetching the posts via a AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page. -->
    [x] Show user's clubs on 'Memberships'

[x] Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.
    <!-- Borrowing from the previous blog domain example, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched via AJAX and rendered through JavaScript. -->
    [x] Allow user to click through the books list using 'Next'

[x] Your Rails application must dynamically render on the page at least one 'has-many' relationship through JSON using JavaScript.
    <!-- In the previous blog domain example, if each of the posts has many comments, you could render those comments as well on that post's show page. -->
    [x] Render comments with AJAX

[x] Must use your Rails application and JavaScript to render a form for creating a resource that submits dynamically.
    <!-- In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this). -->
    [x] Add comment to a discussion with AJAX
        
[x] Must translate the JSON responses into JavaScript Model Objects using either ES6 class or constructor syntax. The Model Objects must have at least one method on the prototype. Formatters work really well for this.
    <!-- Borrowing from the blog domain example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comment's author's first and last name. You would then use the object to append the comment information to the DOM. -->
    [x] Basically format the appended comment somehow — concatenate author's first and last name? Show comment creation time? 

<!-- 
[] Update README.md
    [] Especially on installation — not just for users but also for developers who want to develop on the platform.
    [] Add demo video if possible? Or instructions and functionalities. Refer to App Store apps if necessary. -->