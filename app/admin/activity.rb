ActiveAdmin.register Activity do
  menu priority: 3, label: proc { I18n.t 'active_admin.activities' }

  permit_params :published, :navigated,
                :header, :label, :content,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :parent_id,
                area_ids: [],
                images_attributes: [:id, :index,
                                    :title, :description, :alt,
                                    :upload, :upload_crop,
                                    :_destroy]

  includes :areas, :images


  scope :all, default: true
  scope :published
  scope :navigated

  sortable tree: true,
           max_levels: 3,
           sorting_attribute: :index

  index as: :sortable, default: true do
    label :header do |model|
      sep = '&nbsp;&nbsp;&nbsp;'
      pub = model.published ? 'опубликовано' : '<em>не опубликовано</em>'
      nav = model.navigated ? 'в навигации' : '<em>вне навигации</em>'
      areas = model.areas.empty? ? '' : "#{sep} [ #{model.areas_show} ]"
      "#{model.header} <small># #{model.id} #{sep} #{pub} #{sep} #{nav} #{areas}</small>".html_safe
    end
    actions
  end

  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :navigated, class: 'h-size--boolean'
    column :header
    column :areas, class: 'h-size--20' do |model|
      model.areas_show '<br>'
    end
    column :ancestry_depth, class: 'h-size--integer'
    column :index, class: 'h-size--integer'
    column :created_at
    actions
  end

  filter :header
  filter :areas,
         input_html: {class: 'c-control-select'},
         unless: proc { Area.all.empty? }
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

  batch_action :navigated, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update navigated: true unless model.navigated
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.navigated')
  end

  batch_action :denavigated, priority: 3 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update navigated: false if model.navigated
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.denavigated')
  end

  show do
    attributes_table do
      row :published
      row :navigated
      row :areas do |model|
        model.areas_show '<br>'
      end
      row :content do |model|
        div class: 'с-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
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
        column :upload, class: 'h-size--icon' do |model|
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
          f.input :navigated, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
          f.input :areas, as: :select, include_hidden: false, include_blank: false, multiple: true,
                  collection: Area.all.collect { |model| [model.name, model.id] },
                  input_html: {class: 'c-control-select c-control-select--full h-size--50',
                               size: Area.all.count} unless f.object.new_record? || Area.all.empty?
        end
=begin
        f.inputs do
          f.input :index, as: :number,
                  input_html: {class: 'h-size--10',
                               min: 0}
          f.input :parent_id, as: :select, include_blank: true,
                  collection: Activity.select_options,
                  input_html: {class: 'c-control-select'}
        end
=end
        f.inputs do
          f.input :header
          f.input :label,
                  input_html: {class: 'h-size--40'}
          f.input :content,
                  input_html: {class: 'h-js--autosize h-font--max',
                               rows: 20}
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


  sidebar 'Структура', only: [:show, :edit] do
    attributes_table do
      row :parent
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
            images_recreate_versions_admin_activities_path,
            method: :patch
  end

  action_item :images_recreate_versions, only: :show do
    link_to 'Перемонтировать изображения',
            images_recreate_versions_admin_activities_path(id: resource),
            method: :patch
  end


  collection_action :images_recreate_versions, method: :patch do
    if permitted_params[:id].blank?
      done = Activity.images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения коллекции перемонтированы!"
    else
      done = Activity.find(permitted_params[:id]).images_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения модели перемонтированы!"
    end
  end

end
