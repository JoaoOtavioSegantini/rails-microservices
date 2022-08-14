class CustomerResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :name, as: :text, required: true
  field :email, as: :text, required: true
  field :phone, as: :text, required: true
  field :address, as: :text, required: true
  field :city, as: :text, required: true
  field :state, as: :text, required: true
  field :zipcode, as: :text, required: true
  field :orders, as: :has_many

  # add fields here
end
