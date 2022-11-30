class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :not_valid


private

def not_valid(invalid)
    render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
end
end
