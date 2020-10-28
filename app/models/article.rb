# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch

    validates :title, presence: true
    validates :content, presence: true
    validates :title, length: { minimum:2, maximum:100 }
    validates :content, uniqueness: true
    validates :title, format: { with: /\A(?!\@)/}
    #独自のルール
    validate :validate_title_end_content_length
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    
    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end

    def like_count
        likes.count
    end

    private
    def validate_title_end_content_length
        char_count = self.title.length + self.content.length
        errors.add(:content, '１００文字以上で！') unless char_count > 100
    end
end
