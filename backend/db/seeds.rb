# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create([
    {category_id: 1, name: "仕事・ビジネス"},
    {category_id: 2, name: "スポーツ"},
    {category_id: 3, name: "語学"},
    {category_id: 4, name: "ゲーム"},
    {category_id: 5, name: "アート"},
    {category_id: 6, name: "アニメ・漫画"},
    {category_id: 7, name: "本"},
    {category_id: 8, name: "ファッション"},
    {category_id: 9, name: "飲食"},
    {category_id: 10, name: "テクノロジー"}
    ])
