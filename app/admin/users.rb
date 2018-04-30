ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :admin
    actions
  end


  form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  permit_params :first_name, :last_name, :user_photo, :email, :admin
end

