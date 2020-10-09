class Board < ApplicationRecord
<<<<<<< HEAD
=======
    belongs_to :user

    def author_name
        user.display_name
    end
>>>>>>> master
end
