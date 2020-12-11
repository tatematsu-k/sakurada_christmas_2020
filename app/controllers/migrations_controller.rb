require 'open3'
class MigrationsController < ApplicationController
  InvalidTokenError = Class.new(StandardError)
  CommandError = Class.new(StandardError)
  before_action :authenticate

  def create
    run_cmd!("jets db:migrate")

    render json: { status: "success" }
  end

  private

  def authenticate
    result ||=
      authenticate_with_http_basic do |token, _|
        token == ENV["MIGRATION_TOKEN"]
      end
    raise InvalidTokenError unless result
  end

  def run_cmd!(cmd)
    Open3.capture3(cmd).tap do |stdout,stderr,status|
      p stdout
      p stderr
      raise CommandError, "#{cmd} is failed." unless status.success?
    end
  end

  def authenticate_with_http_basic
    authorization = (headers["authorization"] || headers["Authorization"])&.gsub(/^Basic /, "")
    return nil unless authorization

    user, pass = Base64.decode64(authorization).split(":")
    yield(user, pass)
  end
end
