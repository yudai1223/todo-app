class Task < ApplicationRecord
    belongs_to :user 
    belongs_to :board
    has_one_attached :eyecatch
    has_many :comments , dependent: :destroy

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
