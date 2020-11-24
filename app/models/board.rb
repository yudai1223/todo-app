class Board < ApplicationRecord
    belongs_to :user

    has_many :tasks,dependent: :destroy


    # def author_name
    #     user.display_name
    # end
end
