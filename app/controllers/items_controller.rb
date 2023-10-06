class ItemsController < ApplicationController
  Rails.application.routes.draw do
    root 'items#index'
  end
end
