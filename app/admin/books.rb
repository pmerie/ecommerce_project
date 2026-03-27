ActiveAdmin.register Book do
  permit_params :title, :author, :description, :price, :stock, :category_id

  # ✅ REMOVE BAD RANSACK FILTER (THIS FIXES YOUR CRASH)
  remove_filter :image_attachment
  remove_filter :image_blob

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :description
      f.input :price
      f.input :stock

      f.input :category, as: :select,
              collection: Category.all.map { |c| [ c.category_name, c.id ] }
    end
    f.actions
  end

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

      links << button_to("Delete", admin_book_path(book),
        method: :delete,
        data: { turbo_confirm: "Are you sure?" },
        form: { style: "display:inline;" })

      safe_join(links, " | ")
    end
  end
end
