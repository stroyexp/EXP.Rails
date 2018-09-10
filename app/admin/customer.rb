ActiveAdmin.register Customer do
  permit_params :active, :published,
                :name, :content,
                :email, :phone, :address, :geo, :website,
                :upload,
                :title, :keywords, :description, :canonical, :robots,
                :index,
                :user_id,
                targets_attributes: [:id, :index,
                                     :name, :published, :important]

  menu priority: 4, label: proc { I18n.t 'active_admin.customers' }


  includes :targets


  scope :all, default: true
  scope :active
  scope :published

  index do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column :published, class: 'h-size--boolean'
    column :index, class: 'h-size--integer'
    column :upload, class: 'h-size--icon', sortable: false do |model|
      link_to edit_admin_customer_path(model) do
        imagic_tag model.upload.icon,
                   class: 'c-img--thumbnail h-margin-x--auto',
                    width: 96,
                    height: 96
      end
    end
    column :name
    column :email, class: 'h-size--20'
    column :phone, class: 'h-size--10'
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  batch_action :active, priority: 0 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: true unless model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.active')
  end

  batch_action :deactive, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: false if model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.deactive')
  end

  batch_action :published, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: true unless model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.published')
  end

  batch_action :unpublished, priority: 3 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: false if model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.unpublished')
  end


  show do
    attributes_table do
      row :content do |model|
        div class: 'с-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
      end
      row :email
      row :phone
      row :address
      row :geo
      row :website
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
    panel 'Объекты' do
      table_for resource.targets do
        column :cover, class: 'h-size--icon' do |model|
          imagic_tag model.cover && model.cover.icon
        end
        column :name
        column :id, class: 'h-size--integer' do |model|
          link_to model.id, edit_admin_target_path(model)
        end
      end
    end unless resource.targets.empty?
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :active, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'c-control-select'}
          f.input :index, as: :number,
                  input_html: {class: 'h-size--10',
                               min: 0}
        end
        f.inputs do
          f.input :upload, as: :file,
                  input_html: {accept: f.object.upload.input_accept}
        end
        f.inputs do
          f.input :name,
                  input_html: {class: 'h-size--50'}
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 3}
        end
      end
      tab 'Контакты' do
        f.inputs do
          f.input :phone, as: :phone,
                  input_html: {class: 'h-size--40'}
          f.input :email, as: :email,
                  input_html: {class: 'h-size--40'}
          f.input :address
          f.input :geo,
                  input_html: {class: 'h-size--20'}
          f.input :website,
                  input_html: {class: 'h-size--20'}
          f.input :user, as: :select, include_blank: true,
                  collection: User.all.collect { |u| [u.to_s, u.id] },
                  input_html: {class: 'c-control-select h-size--30'}
        end
      end
      tab 'Объекты' do
        f.inputs do
          f.has_many :targets, heading: false, class: 'has-upload_icon',
                     sortable: 'index', allow_destroy: false, new_record: false do |n|
            n.input :cover, as: :upload_icon,
                    wrapper_html: {class: 'handle'}
            n.input :name
            n.input :published, as: :select, include_blank: false,
                    input_html: {class: 'c-control-select'}
            n.input :important, as: :select, include_blank: false,
                    collection: Target::IMPORTANTS.to_a,
                    input_html: {class: 'c-control-select'}
          end
        end
      end unless f.object.targets.empty?
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
      row :active
      row :published
      row :index
    end
  end

  sidebar 'Логотип', only: [:show, :edit] do
    imagic_tag resource.upload.thumb,
               class: 'c-img--response h-display--block h-margin-x--auto'
  end

  sidebar 'Связи', only: [:show, :edit] do
    attributes_table do
      row :targets do |model|
        link_to model.targets.count, admin_targets_path('q[customer_id_eq]' => model)
      end
      row :feedbacks do |model|
        link_to model.feedbacks.count, admin_feedbacks_path('q[customer_id_eq]' => model)
      end
    end
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
      done = Customer.upload_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения коллекции перемонтированы!"
    else
      done = Customer.find(permitted_params[:id]).upload_recreate_versions
      redirect_back fallback_location: admin_dashboard_path, notice: "[#{done}] Изображения модели перемонтированы!"
    end
  end
end
