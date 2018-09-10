ActiveAdmin.register Area do
  permit_params :active, :index, :name

  menu priority: 2, label: proc { I18n.t 'active_admin.areas' }


  scope :all, default: true
  scope :active

  index do
    selectable_column
    id_column
    column :active, class: 'h-size--boolean'
    column :index, class: 'h-size--integer'
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  batch_action :active, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: true unless model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.active')
  end

  batch_action :deactive, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update active: false if model.active
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.deactive')
  end


  show title: :name do
    attributes_table do
      row :active
      row :index
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :active, as: :select, include_blank: false,
              input_html: {class: 'c-control-select'}
      f.input :index, as: :number, input_html: {class: 'h-size--10', min: 0}
      f.input :name
    end
    f.actions
  end


  sidebar 'Связи', only: [:show, :edit] do
    attributes_table do
      row :activities do |model|
        link_to model.activities.count, admin_activities_path('q[areas_throughs_area_id_eq]' => model)
      end
      row :targets do |model|
        link_to model.targets.count, admin_targets_path('q[areas_throughs_area_id_eq]' => model)
      end
    end
  end
end
