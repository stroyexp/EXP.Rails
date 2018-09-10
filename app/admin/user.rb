ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation,
                :is_admin, :in_staff, :name, :phone, :address

  scope :all, default: true
  scope :admin
  scope :staff
  scope :client

  menu parent: 'Utils', priority: 8, label: proc{ I18n.t 'active_admin.users' }


  index do
    selectable_column
    id_column
    column :is_admin, class: 'h-size--boolean'
    column :in_staff, class: 'h-size--boolean'
    column :name, class: 'h-size--20'
    column :email
    column :current_sign_in_at, class: 'h-size--datetime'
    column :sign_in_count, class: 'h-size--integer'
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :created_at


  show do
    panel 'Авторизация' do
      attributes_table_for resource do
        row :email
        row :encrypted_password
        row :is_admin
        row :in_staff
      end
    end
    panel 'Профиль' do
      attributes_table_for resource do
        row :name
        row :phone
        row :address
      end
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors
    f.inputs 'Авторизация' do
      f.input :email, as: :email,
              input_html: {class: 'h-size--20'}
      f.input :password,
              input_html: {class: 'h-size--20'}
      f.input :password_confirmation,
              input_html: {class: 'h-size--20'}
      f.input :is_admin,
              input_html: {disabled: !current_user.admin?}
      f.input :in_staff,
              input_html: {disabled: !current_user.admin?}
    end
    f.inputs 'Профиль' do
      f.input :name,
              input_html: {class: 'h-size--40'}
      f.input :phone, as: :phone,
              input_html: {class: 'h-size--40'}
      f.input :address
    end
    f.actions
  end


  sidebar 'Связи', only: [:show, :edit] do
    attributes_table do
      row :customers do |model|
        link_to model.customers.count, admin_customers_path('q[user_id_eq]' => model)
      end
    end
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :sign_in_count
      row :current_sign_in_at do |model|
        model.current_sign_in_at.blank? ? '--' : time_ago_in_words(model.current_sign_in_at)
      end
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :updated_at
      row :created_at
    end
  end


  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end
end
