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
        image_url: 'https://picsum.photos/1080/720',
        goal: 50 + i,
        finnish_date: "#{Time.parse((Date.current + 10.days).to_s()).to_s(:iso8601)}",
        user_id: '1'
    })
end

for i in 11..20
    Project.create({
        title: "Test #{i}",
        description: 'An simple test #{i}...', 
        image_url: 'https://picsum.photos/1080/720',
        goal: 50,
        finnish_date: "#{Time.parse((Date.current + 20.days).to_s()).to_s(:iso8601)}",
        user_id: '2'
    })
end

# Outdated project
Project.create({
    title: "Outdated",
    description: 'An simple test...', 
    image_url: 'https://picsum.photos/1080/720',
    goal: 50,
    finnish_date: "#{Time.parse((Date.current).to_s()).to_s(:iso8601)}",
    user_id: '2'
})



for i in 1..3
    Support.create({
        project_id: i,
        user_id: 1,
        value: 200 * i
    })
end