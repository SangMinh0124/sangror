class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,:password_digest,:created_at,:updated_at
end