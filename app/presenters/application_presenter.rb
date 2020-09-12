class ApplicationPresenter
  def initialize(view_context)
    @view = view_context
  end

  def props_to_json
    props.to_json.html_safe
  end

  private

  attr_reader :view

  delegate(
    :params,
    :current_user,
    to: :view
  )
end
