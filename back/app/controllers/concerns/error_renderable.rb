module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    # 想定以外のエラーの場合は５００を返す。
    rescue_from Exception do |e|
      Rails.logger.error('Error: ' + e.message)
      render json: {message: 'Server Error'}, status: :internal_server_error
    end

    # TODO: 다른 공통에러처리 할만한 것들 추가
  end
end