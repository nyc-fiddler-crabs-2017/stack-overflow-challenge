class CreateVotes < ActiveRecord::Migration
  def change
    create_table    :votes do |t|
      t.integer     :up_or_down, full: false

      t.references  :user, null: false

      # polymorphic
      t.integer     :votable_id, null: false
      t.string      :votable_type, null: false

      t.timestamps  null: false
    end
  end
end
