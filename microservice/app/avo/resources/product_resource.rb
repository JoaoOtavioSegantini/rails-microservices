class ProductResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # add fields here
  field :name, as: :text, required: true
  field :description, as: :text, required: true
  field :price, as: :number, required: true
  field :qtd_avaliable, as: :number
  field :qtd_total, as: :number
end
