class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :name, as: :text, required: true
  field :email, as: :text, required: true
  field :password, as: :text, required: true
  field :password_confirmation, as: :text, required: true
  field :profile,
    as: :select,
    enum: ::User.profiles,
    display_with_value: true,
    placeholder: 'Escolha o nível de permissão do usuário.'
  # add fields here
end
