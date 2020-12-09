class Article < ApplicationRecord
    has_many :comments
    accepts_nested_attributes_for :comments, reject_if: proc {|attributes| attributes['commenter'].blank?}
  # validates :title, presence: true, length: { minimum: 5 }
   
  def self.search(search)
    if search
        @article = Article.where('title LIKE ?', "%#{search}%")
    else
      @article = Article.all
    end
    end

end
