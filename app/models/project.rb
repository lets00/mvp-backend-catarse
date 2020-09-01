class Project < ApplicationRecord
    validates :title, presence: true, length: {maximum: 64}
    validates :description, presence: true, length: {maximum: 512}
    validates :image_url, presence: true
    validates_numericality_of :goal, greater_than: 0, less_than_or_equal_to: 500, message: 'Value must be between 0 to 500'
    validates_date :finnish_date, presence: true, on_or_after: lambda{ Date.current }, on_or_before: lambda { Date.current + 30.days }
    validates :user_id, presence: true
end
