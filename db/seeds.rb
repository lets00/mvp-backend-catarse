for i in 0..10
    Project.create({
        title: "Test #{i}",
        description: 'An simple test...', 
        image_url: 'http://www.google.com',
        meta: '5000',
        finnish_date: '20201030'
    })
end