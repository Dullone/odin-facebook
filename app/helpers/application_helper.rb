module ApplicationHelper
  def date_distance_in_words_if_less_than_day(date)
    if Time.now - date < 1.days
      time_ago_in_words(date) + " ago"
    else
      date
    end
  end
end
