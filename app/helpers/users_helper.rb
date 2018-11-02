module UsersHelper

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def show_bio(user)
    user.bio.nil? || user.bio == "" ? "Add your introduction here!" : user.bio
  end

  def show_clubs(user)
    clubs = user.followees(Club)
    html = ''
    if clubs.empty?
        if user == current_user
            "You have not joined any club yet."
        else
            "This user has not joined any club yet."
        end
    else
        clubs.each do |club|
            html += link_to(club.name, club_path(club))
        end
        return html.html_safe
    end
  end

  def show_socials(user, social)
    content = content_tag(:i, "", class: "fab fa-#{social}")

    if social == "twitter" && user.twitter != "" && user.twitter
        html = 'https://twitter.com/'
        social_link = html + user.twitter 
    elsif social == "facebook" && user.facebook != "" && user.facebook
        html = 'https://www.facebook.com/'
        social_link = html + user.facebook
    elsif social == "instagram" && user.instagram != "" && user.instagram
        html = 'https://www.instagram.com/'
        social_link = html + user.instagram
    elsif social == "slack" && user.slack != "" && user.slack
        html = 'https://rebelbasetalk.slack.com/team/'
        social_link = html + user.slack
    else
        content = ""
    end
    
    content_tag(:a, content, href: social_link)
  end

  def random_book_quote(quote, author)
    "#{quote} — #{author}"
  end


end