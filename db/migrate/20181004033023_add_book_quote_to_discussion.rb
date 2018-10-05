class AddBookQuoteToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :book_quote, :text
  end
end
