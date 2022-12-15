module Paginable

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:count] || 20).to_i
  end
end