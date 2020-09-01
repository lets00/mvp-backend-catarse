class Support < ApplicationRecord
    validates :user_id, presence: true
    validates :project_id, presence: true
    validates_numericality_of :value, presence: true, greater_than: 0
end
