ActiveAdmin.register Target do
  menu priority: 5, label: proc { I18n.t 'active_admin.targets' }

  permit_params :published,
                :important, :start_at, :finish_at,
                :name, :content,
                :address, :geo, :website,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :customer_id,
                area_ids: [],
                images_attributes: [:id, :index,
                                    :title, :description, :alt,
                                    :upload, :upload_crop,
                                    :_destroy]

  includes :customer, :areas, :images


  scope :all, default: true
  scope :published
  scope :important

  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :important, class: 'h-size--integer'
    column :index, class: 'h-size--integer'
    column :name
    column :areas, class: 'h-size--20' do |model|
      model.areas_show '<br>'
    end
    column :customer
    column :created_at
    actions
  end

  index as: :table_alter do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :important, class: 'h-size--integer'
    column :index, class: 'h-size--integer'
    column :cover, class: 'h-size--icon', sortable: false do |model|
      link_to edit_admin_target_path(model) do
        imagic_tag model.cover,
                   class: 'c-img--thumbnail h-margin-x--auto',
                   width: 96,
                   height: 96
      end
    end
    column :name
    column :start_at, class: 'h-size--date'
    column :finish_at, class: 'h-size--date'
    actions
  end

  filter :name
  filter :areas,
         input_html: {class: 'c-control-select'},
         unless: proc { Area.all.empty? }
  filter :customer,
         input_html: {class: 'c-control-select'},
         unless: proc { Customer.all.empty? }
  filter :created_at

  batch_action :published, priority: 0 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: true unless model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.published')
  end

  batch_action :unpublished, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: false if model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.unpublished')
  end


  show do
    attributes_table do
      row :important do |model|
        Target::IMPORTANTS.key model.important
      end
      row :customer
      row :content do |model|
        div class: 'с-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
      end
      row :address
      row :geo
      row :website
    end
    panel 'Деятельность' do
      attributes_table_for resource do
        row :areas do |model|
          model.areas_show '<br>'
        end
        row :start_at
        row :finish_at
      end
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
          f.input :customer, as: :select, include_hidden: true,
                  collection: Customer.all.collect { |model| [model.name, model.id] },
                  input_html: {class: 'c-control-select h-size--50'} unless Customer.all.empty?
          f.input :important, as: :select, include_blank: false,
                  collection: Target::IMPORTANTS.to_a,
                  input_html: {class: 'c-control-select'}
        end
        f.inputs do
          f.input :name
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 3}
          f.input :address
          f.input :geo,
                  input_html: {class: 'h-size--20'}
          f.input :website,
                  input_html: {class: 'h-size--20'}
        end
      end
      tab 'Деятельность' do
        f.inputs do
          f.input :areas, as: :select, include_hidden: false, include_blank: false, multiple: true,
                  collection: Area.all.collect { |model| [model.name, model.id] },
                  input_html: {class: 'c-control-select c-control-select--full h-size--50',
                               size: Area.all.count} unless Area.all.empty?
          f.input :start_at, as: :date_picker
          f.input :finish_at, as: :date_picker
        end
      end unless f.object.new_record?
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
            n.object.upload_crop = true if n.object.new_record?
            n.input :upload_crop, as: :select, include_blank: false,
                    input_html: {class: 'c-control-select'}
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
      done = Target.images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения коллекции перемонтированы!"
    else
      done = Target.find(permitted_params[:id]).images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения модели перемонтированы!"
    end
  end
end
