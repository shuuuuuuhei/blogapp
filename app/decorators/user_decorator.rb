# frozen_string_literal: true

module UserDecorator
    def display_name
        #ぼっち演算子
        profile&.nickname || self.email.split('@').first
    end

    def avatar_image
        if profile&.avatar&.attached?
          profile.avatar
        else
          'default-avatar.png'
        end
    end
end
