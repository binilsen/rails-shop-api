# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
Product.create(name: 'iPhone X',
               title: 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with',
               stock: 4, price: 899.0, thumbnail: 'https://dummyjson.com/image/i/products/2/thumbnail.jpg')
Product.create(name: 'OPPOF19',
               title: ' OPPO F19 is officially announced on April 2021',
               stock: 6, price: 280.0, thumbnail: 'https://dummyjson.com/image/i/products/4/thumbnail.jpg')
Product.create(name: 'Huawei P30',
               title: ' Huawei re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.',
               stock: 10, price: 499.0, thumbnail: 'https://dummyjson.com/image/i/products/5/thumbnail.jpg')
