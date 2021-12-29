# frozen_string_literal: false

class HomeController < ApplicationController
  # Method get all users data
  def get_all_users
    query_string = ''
    is_call_where = false

    if params[:name].present?
      query_string.concat("LOWER(name) LIKE LOWER('%#{params[:name]}%')")
      is_call_where = true
    end

    if params[:phone].present?
      if is_call_where
        query_string.concat(" AND LOWER(phone) LIKE LOWER('%#{params[:phone]}%')")
      else
        query_string.concat("LOWER(phone) LIKE LOWER('%#{params[:phone]}%')")
        is_call_where = true
      end
    end

    @user = User.where(query_string).order(created_at: :desc)
    render json: {
      message: 'Success view a users data',
      values: @user
    }, status: :ok
  end

  # Method create user
  def post_user
    name = params[:name]
    phone = params[:phone]
    description = params[:description]

    @create = User.create(name: name, phone: phone, description: description)

    render json: {
      message: 'Success create user data',
      values: @create
    }, status: :created
  end

  # Method get users by ID
  def get_by_id
    @user = User.find_by_id(params[:id])
    if @user.present?
      render json: {
        message: 'Success get users by id',
        values: @user
      }, status: :ok
    else
      render json: {
        message: 'Can`t found any user data',
        values: nil
      }, status: :not_found
    end
  end
end
