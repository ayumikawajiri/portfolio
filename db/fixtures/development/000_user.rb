
User.seed(:id,
  {
    id: 1,
    name: "admin",
    email: "admin@admin.com",
    password: "admin",
    admin: true
  }
)

20.times do |i|
  User.seed(:id,
    {
      id: i + 2,
      name: "user#{ i + 1 }",
      email: "user#{ i + 1 }@user.com",
      password: "pass#{ i + 1 }"
    }
  )
end
