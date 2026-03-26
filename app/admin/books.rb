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
      links << link_to("Delete", admin_book_path(book),
        method: :delete,
        data: { turbo_method: :delete, turbo_confirm: "Are you sure?" })

      safe_join(links, " | ")
    end
  end
end
