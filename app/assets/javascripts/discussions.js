$(function() {
    listenForClick();
    listenForSubmit();
})

function listenForClick() {
    $('a.load_comments').on('click', function(e) {
        if ($('div.comment-wrapper').text().length === 0) {
            $('a.load_comments').html('Hide All Comments')
            getComments();
        } else {
            $('a.load_comments').html('Show All Comments')
            $('div.comment-wrapper').empty();
        }
        e.preventDefault();
    })
}

function listenForSubmit() {
    $('form#new_comment').on('submit', function(e) {
        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            dataType: 'json',
            success: function(data) {
                $('div.comment-wrapper').empty();
                getComments();
                $('#comment_body').val('');
            }
        })
        e.stopPropagation();
        e.preventDefault();
    })
}

function getComments() {
    let x = this.href
    $.ajax({
        url: x,
        dataType: 'json',
        success: function(data) {
                data.map(discussion => {
                const newDiscussion = new Discussion(discussion)
                const newCommentHTML = newDiscussion.commentHTML()
                document.getElementById(`comment-wrapper-${discussion.id}`).innerHTML += newCommentHTML;
            })
        }
    })
}

class Discussion {
    constructor(obj) {
        this.id = obj.id
        this.title = obj.title
        this.body = obj.body
        this.comments = obj.comments_with_user
    }
}

Discussion.prototype.commentHTML = function() {
    let fullURL = window.location.href
    let regex = new RegExp('.+discussions')
    let discussionURL = fullURL.match(regex)
    let discussionComments = this.comments.map(comment => {
        let commentTime = new Date(comment.created_at).toDateString()
        return (`
            <p><b>${comment.username}</b> says: ${comment.body} <i>(${commentTime})</i>
            <a data-method="delete" href=${discussionURL}/${comment.discussion_id}/comments/${comment.id}/destroy>Delete</a></p>
        `)
    }).join('')

    return discussionComments

    // http://localhost:3000/clubs/unbound/shelves/1/books/the-three-body-problem/discussions?id=the-three-body-problem/discussions/3/3/comments/135/destroy
}