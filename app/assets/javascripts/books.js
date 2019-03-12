$(function() {
    var array; 
    var index;
    var nextID;
    // 2nd click: everything resets here because of $.getJSON('', ... ) — data['id'] is back to book A as ('') refers back to the unchanged URL of book A in the bar — how to update ('')?
    // 1) move block I to outside click callback function. nextID in block II becomes undefined. make nextID global? YESSSSS

    // Find which sub-shelf book belongs to
    $.getJSON('', function(data) {
        $.each(data['shelf'], function(key, val) {
            if (val.length > 1) {
                if (val.includes(data['id'])) {
                    array = data['shelf'][key]
                    // 1st click: here data['id'] is for book A // PERFECT
                    // 2nd click: data['id'] should be for book B
                }
            }
        })

        index = array.indexOf(data['id'])
    })

    $('.js-next').on('click', function(e) {
        // Incrementally iterate through sub-shelf array elements and append the JSON data
        if (index >= 0 && index < array.length - 1) {
            nextID = array[index + 1]
            index += 1
            if (index === array.length - 1) {
                $('.js-next').text('')
            }
        }

        $.getJSON('' + nextID + '.json', function(data) {
            $('.book-title').text(data['title'])
            $('.book-author').text(data['author'])
            $('.book-description').text(data['description'])
            $('.book-image').attr('src', data['image'])

            $('.js-next').attr('data-id', data['id'])
            // 1st click: data['id'] should be for book B // PERFECT
            // 2nd click: data['id] should update for book C 
        })

        e.preventDefault();
    })
})


// http://localhost:3000/clubs/unbound/shelves/1/books/21#