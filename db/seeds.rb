# Admin user (safe - prevents duplicate error)
AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end

# =========================
# BOOK STORE SEED DATA
# =========================

# Clear old data (important for re-seeding)
Category.destroy_all
Book.destroy_all

# Create categories
fiction = Category.create!(category_name: "Fiction")
non_fiction = Category.create!(category_name: "Non-Fiction")
children = Category.create!(category_name: "Children")
fantasy = Category.create!(category_name: "Fantasy")

# Create books (10 real books)
Book.create!([
  {
    title: "1984",
    author: "George Orwell",
    description: "A dystopian novel about surveillance and government control.",
    price: 18.50,
    stock: 10,
    category: fiction
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    description: "A story about racial injustice and childhood innocence.",
    price: 19.99,
    stock: 12,
    category: fiction
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    description: "A critique of wealth and the American Dream.",
    price: 17.00,
    stock: 8,
    category: fiction
  },
  {
    title: "Sapiens",
    author: "Yuval Noah Harari",
    description: "A journey through the history of humankind.",
    price: 25.00,
    stock: 15,
    category: non_fiction
  },
  {
    title: "Educated",
    author: "Tara Westover",
    description: "A memoir about growing up isolated and pursuing education.",
    price: 22.00,
    stock: 9,
    category: non_fiction
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    description: "A fantasy adventure of Bilbo Baggins.",
    price: 21.00,
    stock: 14,
    category: fantasy
  },
  {
    title: "Harry Potter and the Sorcerer’s Stone",
    author: "J.K. Rowling",
    description: "A young wizard begins his journey at Hogwarts.",
    price: 20.00,
    stock: 20,
    category: fantasy
  },
  {
    title: "Charlotte’s Web",
    author: "E.B. White",
    description: "A heartwarming children’s story about friendship.",
    price: 15.00,
    stock: 11,
    category: children
  },
  {
    title: "The Cat in the Hat",
    author: "Dr. Seuss",
    description: "A fun rhyming children’s book full of chaos and play.",
    price: 14.00,
    stock: 13,
    category: children
  },
  {
    title: "The Alchemist",
    author: "Paulo Coelho",
    description: "A philosophical journey about destiny and purpose.",
    price: 19.00,
    stock: 16,
    category: fiction
  }
])
