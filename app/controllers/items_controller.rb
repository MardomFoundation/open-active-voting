# coding: utf-8

# Copyright (C) 2010-2017 Íbúar ses / Citizens Foundation Iceland
# Authors Robert Bjarnason, Gunnar Grimsson & Gudny Maren Valsdottir
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'browser'

class ItemsController < ApplicationController

  # This will detect bots and render a special shareable page for them otherwise the main index page
  def index
    browser = Browser.new(
        request.user_agent,
        accept_language: request.env["HTTP_ACCEPT_LANGUAGE"]
    )

    if !browser.bot?
      @item = BudgetBallotItem.find(params[:id])
      @ballot = @item.budget_ballot
      respond_to do |format|
        format.html { render :layout => false }
      end
    else
      redirect_to '/'
    end
  end
end
