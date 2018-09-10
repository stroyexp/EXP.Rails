ActiveAdmin.register Publish do

  menu priority: 9, label: proc { I18n.t 'active_admin.publishes' }

  permit_params :published, :published_at,
                :header, :content, :partial,
                :source,
                :title, :keywords, :description, :canonical, :robots

  scope :all, default: true
  scope :published
  scope :unpublished

  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :published_at, class: 'h-size--date'
    column :header
    column :partial, class: 'h-size--20'
    column :created_at
    actions
  end

  filter :published_at
  filter :header
  filter :content
  filter :partial
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
      row :content do |model|
        div class: 'с-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
      end
      row :partial
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
          f.input :header
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 7}
          f.input :partial,
                  input_html: {class: 'h-size--20'}
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

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end

end
