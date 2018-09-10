ActiveAdmin.register Image do
  permit_params :title, :description, :alt,
                :upload, :upload_crop

  menu parent: 'Utils', priority: 1, label: proc { I18n.t 'active_admin.images' }

  actions :all, except: [:new]


  index do
    selectable_column
    id_column
    column :resource, class: 'h-size--10'
    column :index, class: 'h-size--integer'
    column :upload, class: 'h-size--icon', sortable: false do |model|
      link_to edit_admin_image_path(model) do
        imagic_tag model.upload.icon,
                   class: 'c-img--thumbnail h-margin-x--auto',
                   width: 96,
                   height: 96
      end
    end
    column :title
    column :description, class: 'h-size--20'
    column :alt, class: 'h-size--10'
    column :upload_crop, class: 'h-size--boolean'
    column :created_at
    actions class: 'h-size--actions-short'
  end


  filter :upload
  filter :title
  filter :created_at


  show do
    attributes_table do
      row :title
      row :description do |model|
        div class: 'с-text--readable' do
          model.description
        end unless model.description.blank?
      end
      row :alt
      row :upload_crop
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :upload, as: :file,
              input_html: {accept: f.object.upload.input_accept}
      f.input :upload_crop, as: :select, include_blank: false,
              input_html: {class: 'c-control-select'}
    end
    f.inputs do
      f.input :title,
              input_html: {class: 'h-size--50'}
      f.input :description,
              input_html: {class: 'h-js--autosize',
                           rows: 3}
      f.input :alt,
              input_html: {class: 'h-size--50'}
    end
    f.actions
  end


  sidebar 'Структура', only: [:show, :edit] do
    attributes_table do
      row :resource
      row :index
    end
  end

  sidebar 'Изображение', only: [:show, :edit] do
    imagic_tag resource.upload.thumb,
               class: 'c-img--response h-display--block h-margin-x--auto'
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end


  action_item :upload_recreate_versions, only: :index do
    link_to 'Перемонтировать изображения', upload_recreate_versions_admin_images_path, method: :patch
  end


  collection_action :upload_recreate_versions, method: :patch do
    done = Image.upload_recreate_versions
    redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения перемонтированы!"
  end
end
