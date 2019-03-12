$(function() {
    $.getJSON('', function(data) {
        var genre = data[0]['genre']
        // console.log(data)
        // console.log(data[0]['genre'].toLowerCase())
        $('.genre').addClass(genre.toLowerCase())
        $('.genre').html(genre)
    })
})