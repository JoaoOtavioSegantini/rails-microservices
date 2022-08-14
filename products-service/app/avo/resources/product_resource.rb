class ProductResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :name, as: :text
  field :description, as: :text
  field :price, as: :number
  field :qtd_avaliable, as: :number
  field :qtd_total, as: :number
  # add fields here
end
