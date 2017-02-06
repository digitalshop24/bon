Role.where(name: 'admin').first_or_create
Role.where(name: 'subscriber').first_or_create
Role.where(name: 'editor').first_or_create

unless Role.where(name: 'admin').first.users.any?
  admin = User.create(email: 'admin@bon.com', password: 'password', password_confirmation: 'password')
  admin.add_role :admin
end

unless Role.where(name: 'subscriber').first.users.any?
  user = User.create(email: 'subscriber@bon.com', password: 'password', password_confirmation: 'password')
  user.add_role :subscriber
end

unless Role.where(name: 'editor').first.users.any?
  user = User.create(email: 'editor@bon.com', password: 'password', password_confirmation: 'password')
  user.add_role :editor
  user.save
end

unless User.find_by(email: 'anonym@bon.com').present?
  User.create(email: 'anonym@bon.com', password: 'password', password_confirmation: 'password')
end
