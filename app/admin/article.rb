ActiveAdmin.register Article do

  permit_params :published, :published_at,
                :header, :annotation, :content,
                :upload,
                :title, :keywords, :description, :canonical, :robots

  menu priority: 8, label: proc { I18n.t 'active_admin.articles' }

  scope :all, default: true
  scope :published
  scope :unpublished

  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :published_at, class: 'h-size--date'
    column :upload, class: 'h-size--icon', sortable: false do |model|
      link_to admin_article_path(model) do
        imagic_tag model.upload.icon,
                   class: 'c-img--thumbnail h-block h-margin-x--auto',
                   width: 96,
                   height: 96
      end
    end
    column :header, class: 'h-size--20'
    column :annotation
    column :created_at
    actions
  end

  filter :published_at
  filter :header
  filter :annotation
  filter :content
  filter :updated_at
  filter :created_at

  batch_action :published, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: true unless model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.published')
  end

  batch_action :unpublished, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: false if model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.unpublished')
  end


  show do
    attributes_table do
      row :header
      row :annotation
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
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
          f.input :published_at, as: :date_picker
        end
        f.inputs do
          f.input :upload, as: :file,
                  input_html: {accept: f.object.upload.input_accept}
          f.input :upload_crop, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
        end
        f.inputs do
          f.input :header
          f.input :annotation,
                  input_html: {class: 'h-js--autosize h-js--autosize',
                               rows: 3}
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 7}
        end
      end
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


  sidebar 'Публикация', only: :show do
    attributes_table_for resource do
      row :published
      row :published_at
    end
  end

  sidebar 'Баннер', only: [:show, :edit] do
    imagic_tag resource.upload.thumb,
               class: 'c-img--response h-display--block h-margin-x--auto',
               width: 320,
               height: 240
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end


  action_item :upload_recreate_versions, only: :index do
    link_to 'Перемонтировать изображения',
            upload_recreate_versions_admin_customers_path,
            method: :patch
  end

  action_item :upload_recreate_versions, only: :show do
    link_to 'Перемонтировать изображения',
            upload_recreate_versions_admin_customers_path(id: resource),
            method: :patch
  end


  collection_action :upload_recreate_versions, method: :patch do
    if permitted_params[:id].blank?
      done = Article.upload_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения коллекции перемонтированы!"
    else
      done = Article.find(permitted_params[:id]).upload_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения модели перемонтированы!"
    end
  end

end
