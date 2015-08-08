class SupportTicketController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @ticket = SupportTicket.find(params[:id])
    render json: @ticket.to_json
  end

  def index
    @tickets = SupportTicket.limit(5).offset(params[:offset])
    render json: @tickets.to_json
  end
end
