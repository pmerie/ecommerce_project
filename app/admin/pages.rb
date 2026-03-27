ActiveAdmin.register Page do
  config.batch_actions = true

  permit_params :title, :content, :slug

  controller do
    def destroy
      resource.destroy
      redirect_to admin_pages_path, notice: "Page deleted successfully"
    end
  end

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
