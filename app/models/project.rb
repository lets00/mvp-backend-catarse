class Project < ApplicationRecord
    validates :title, presence: true, length: {maximum: 64}
    validates :description, presence: true, length: {maximum: 512}
    validates :image_url, presence: true
    validates :meta, presence: true
    validates :finnish_date, presence: true
    validates :user_id, presence: true
end
