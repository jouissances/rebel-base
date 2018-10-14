module ClubsHelper

    def link_to_toggle_club_follow(club)
        url = membership_path(club)

        if club.followed_by?(current_user)
            link_to("Unfollow", url, {
                method: 'DELETE',
                remote: true,
                class: 'follow btn btn-primary',
            })
        else
            link_to("Follow", url, {
                method: 'PUT',
                remote: true,
                class: 'follow btn',
            })
        end
    end

end
