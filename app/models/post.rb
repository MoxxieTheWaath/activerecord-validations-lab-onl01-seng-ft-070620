class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        if title.present? && title.exclude?("Won't Believe") && title.exclude?("Secret") && title.exclude?("Top [number]") && title.exclude?("Guess")
            errors.add(:title, "Not Clickbait")
        end
    end
end
