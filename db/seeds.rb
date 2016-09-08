Role.create(name: 'admin') if Role.find_by(name: 'admin').nil?
Role.create(name: 'subscriber') if Role.find_by(name: 'subscriber').nil?
Role.create(name: 'editor') if Role.find_by(name: 'editor').nil?

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