class Article < ActiveRecord::Base

  has_many :comments

  def calc_rating

    avg_rating = 0
    if comments.count != 0
      comments.each do |comment|
        avg_rating += comment.rating
      end
      avg_rating = avg_rating/comments.count
      return avg_rating
    else
      return 0
    end

  end

end