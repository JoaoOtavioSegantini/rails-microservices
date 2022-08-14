class OrderResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # add fields here
  field :status, as: :text, required: true
  field :discount, as: :number, required: false
  field :total, as: :number, required: false
  field :order_date, as: :date_time, required: true
  field :order_items, as: :has_many
  field :customer, as: :belongs_to
end
