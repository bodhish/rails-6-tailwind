module Layouts
  class ApplicationPresenter < ::ApplicationPresenter
    def flash_messages
      view.flash.map do |type, message|
        {
          type: type,
          message: message
        }
      end.to_json
    end
  end
end
