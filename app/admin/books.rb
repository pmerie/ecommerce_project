ActiveAdmin.register Book do
  permit_params :title, :author, :description, :price, :stock, :category_id
  index do
    selectable_column
    id_column
    column :title
    column :author
    column :price
    column :stock
    column :category do |book|
      book.category&.category_name
    end
    column "Actions" do |book|
      links = []
      links << link_to("View", admin_book_path(book))
      links << link_to("Edit", edit_admin_book_path(book))
      # Use button_to for delete - this is the most reliable with Turbo
      links << button_to("Delete", admin_book_path(book),
        method: :delete,
        data: { confirm: "Are you sure you want to delete this book?" },
        class: "text-red-600 hover:underline"   # makes it look more like a link
      )
      safe_join(links, " | ")
    end
  end
end
