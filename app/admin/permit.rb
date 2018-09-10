ActiveAdmin.register Permit do

  permit_params :published,
                :name, :number, :provider, :issue_at, :onset_at, :ends_at,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                images_attributes: [:id, :index,
                                    :title, :description, :alt,
                                    :upload, :upload_crop,
                                    :_destroy]

  menu priority: 6, label: proc { I18n.t 'active_admin.permits' }


  includes :images


  scope :all, default: true
  scope :published


  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :index, class: 'h-size--integer'
    column :name
    column :number, class: 'h-size--20'
    column :provider, class: 'h-size--20'
    column :issue_at, class: 'h-size--date'
    column :created_at
    actions
  end

  index as: :table_alter do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :index, class: 'h-size--integer'
    column :cover, class: 'h-size--icon', sortable: false do |model|
      link_to edit_admin_target_path(model) do
        imagic_tag model.cover,
                   class: 'c-img--thumbnail h-margin-x--auto',
                   width: 96,
                   height: 96
      end
    end
    column :name, class: 'h-size--20'
    column :number
    column :issue_at, class: 'h-size--date'
    column :onset_at, class: 'h-size--date'
    column :ends_at, class: 'h-size--date'
    actions
  end

  filter :name
  filter :created_at


  show do
    attributes_table do
      row :name
      row :number
      row :provider
      row :issue_at
      row :onset_at
      row :ends_at
    end
    panel 'SEO' do
      attributes_table_for resource do
        row :title
        row :keywords
        row :description
      end
      attributes_table_for resource do
        row :canonical
        row :robots
      end
    end
    panel 'Изображения' do
      table_for resource.images do
        column :id, class: 'h-size--integer' do |model|
          if can? :update, Image
            link_to model.id, edit_admin_image_path(model)
          else
            model.id
          end
        end
        column :upload, class: 'h-size--10' do |model|
          imagic_tag model.upload.icon
        end
        column :title, class: 'h-size--40'
        column :alt
        column :upload_crop, class: 'h-size--10' do |model|
          status_tag model.upload_crop
        end
      end
    end unless resource.images.empty?
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
          f.input :index, as: :number,
                  input_html: {class: 'h-size--10',
                               min: 0}
        end
        f.inputs do
          f.input :name
          f.input :number,
                  input_html: {class: 'h-size--30'}
          f.input :provider,
                  input_html: {class: 'h-size--50'}
        end
        f.inputs do
          f.input :issue_at, as: :date_picker
          f.input :onset_at, as: :date_picker
          f.input :ends_at, as: :date_picker
        end
      end
      tab 'Изображения' do
        f.inputs do
          f.has_many :images, heading: false, class: 'has-upload_icon',
                     sortable: 'index', allow_destroy: true, new_record: 'Добавить' do |n|
            if n.object.new_record?
              n.input :upload, as: :file,
                      input_html: {accept: n.object.upload.input_accept}
            else
              n.input :upload, as: :upload_icon,
                      wrapper_html: {class: 'handle'}
            end
            n.input :title
            n.input :alt
          end
        end
      end unless f.object.new_record?
      tab 'SEO' do
        f.inputs do
          f.input :title
          f.input :keywords
          f.input :description
        end
        f.inputs do
          f.input :canonical
          f.input :robots, as: :select, include_blank: true,
                  collection: Webpage::ROBOTS.to_a,
                  input_html: {class: 'c-control-select'}
        end
      end
    end
    f.actions
  end

  sidebar 'Состояние', only: :show do
    attributes_table_for resource do
      row :published
      row :index
    end
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end


  action_item :images_recreate_versions, only: :index do
    link_to 'Перемонтировать изображения',
            images_recreate_versions_admin_targets_path,
            method: :patch
  end

  action_item :images_recreate_versions, only: :show do
    link_to 'Перемонтировать изображения',
            images_recreate_versions_admin_targets_path(id: resource),
            method: :patch
  end


  collection_action :images_recreate_versions, method: :patch do
    if permitted_params[:id].blank?
      done = Permit.images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения коллекции перемонтированы!"
    else
      done = Permit.find(permitted_params[:id]).images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения модели перемонтированы!"
    end
  end

end
