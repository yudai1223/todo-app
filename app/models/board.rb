class Board < ApplicationRecord
    belongs_to :user ,dependent: :destroy

    has_many :tasks

    # def author_name
    #     user.display_name
    # end
end
