namespace 'users' do
  task create: :environment do
    2000.times do
      fname = Faker::Name.first_name
      lname = Faker::Name.last_name
      email = Faker::Internet.email(name: "#{fname} #{lname}", separators: ['-', '_', '.'], domain: 'example')
      username = Faker::Internet.username(specifier: "#{fname} #{lname}", separators: ['-', '_', '.'])

      User.new(
        email: email,
        username: username,
        first_name: fname,
        last_name: lname,
        password: 'password'
      ).save!

      puts "Created user: #{username}"
    end
  end
end
