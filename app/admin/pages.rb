ActiveAdmin.register Page do
  permit_params :title, :content, :slug

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :content
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :content
    actions
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :content
    end
  end
end
