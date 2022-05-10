class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, uniqueness: true
    validates :password,
        length: { minimum: 6 },
        if: -> { new_record? || !password.nil? }

    enum role: [:member, :admin]

    after_initialize do
        if self.new_record? || self.role.nil?
            self.role ||= :member
        end
    end

    def admin?
        self.role == 'admin'
    end
end
