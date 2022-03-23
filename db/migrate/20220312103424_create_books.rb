class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      ## 本のタイトルを保存するカラム
      t.string :title
      ## 感想カラム
      t.text :body
      ## その本に関する投稿をどのユーザーがしたのか識別する為のIDカラム
      t.integer :user_id

      t.timestamps
    end
  end
end
