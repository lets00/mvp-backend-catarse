User.create({
    username: "lets00",
    password: "asdf123",
    password_confirmation: "asdf123"
})

User.create({
    username: "lets01",
    password: "asdf123",
    password_confirmation: "asdf123"
})

for i in 1..10
    Project.create({
        title: "Test #{i}",
        description: 'An simple test...', 
        image_url: 'http://www.google.com',
        goal: 50,
        finnish_date: "#{30.days.ago.to_i}",
        user_id: '1'
    })
end

for i in 11..20
    Project.create({
        title: "Test #{i}",
        description: 'An simple test...', 
        image_url: 'http://www.google.com',
        goal: 50,
        finnish_date: "#{30.days.ago.to_i}",
        user_id: '2'
    })
end