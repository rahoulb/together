class SectionsController < ApplicationController
  def show
    @section = current_site.sections.find params[:section_id]
    @pages = @section.pages.latest.page page_number
    @next_page_number = page_number + 1
    @previous_page_number = page_number == 1 ? nil : page_number - 1
  end

  protected

  def page_number
    (params[:page] || 1).to_i
  end
end
