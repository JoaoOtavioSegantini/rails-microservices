class OrderItemResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # add fields here
  field :qtd, as: :text, required: true
  field :total, as: :number
  field :order, as: :belongs_to, required: true
  field :product, as: :belongs_to, required: true

end
