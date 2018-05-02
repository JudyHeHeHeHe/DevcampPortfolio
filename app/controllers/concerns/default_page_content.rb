module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_pate_defaults
  end

  def set_pate_defaults
    @page_title = "Devcamp Portfolio | My Portfolio Website"
    @seo_keywords = "Hello there"
  end
end
