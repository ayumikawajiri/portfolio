
User.seed(:id,
  {
    id: 1,
    name: "admin",
    email: "admin@admin.com",
    password: "admin",
    admin: true
  }
)

User.seed(:id,
  {
    id: 2,
    name: "testuser",
    email: "test@user.com",
    password: "websuku201707"
  }
)