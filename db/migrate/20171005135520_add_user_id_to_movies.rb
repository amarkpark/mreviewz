class AddUserIdToMovies < ActiveRecord::Migration
  def change
    add_reference :movies, :user, foreign_key: true, index: true
  end
end
