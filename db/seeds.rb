# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all

Category.destroy_all
Category.create(name: 'mobiles',
                title: ' A mobile not just keeps you connected to your family and friends but you can also play games, browse the internet, attend online classes, click pictures, and do a lot of other things on it.')
Category.create(name: 'smartwatches',
                title: 'Browse smartwatches for men & women online from top brands like Apple, boAt, Amazfit, Fitbit & many more at the best prices. ')
Product.create(name: 'iPhone X',
               title: 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with',
               stock: 4, price: 899.0, thumbnail: 'https://dummyjson.com/image/i/products/2/thumbnail.jpg', category: Category.first)
Product.create(name: 'OPPOF19',
               title: ' OPPO F19 is officially announced on April 2021',
               stock: 6, price: 280.0, thumbnail: 'https://dummyjson.com/image/i/products/4/thumbnail.jpg', category: Category.first)
Product.create(name: 'Huawei P30',
               title: ' Huawei re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.',
               stock: 10, price: 499.0, thumbnail: 'https://dummyjson.com/image/i/products/5/thumbnail.jpg', category: Category.first)

Product.create(name: 'Pebble Cosmos Ultra', title: 'The Pebble Cosmos Ultra is the perfect companion for your fitness transformation with a 1.91 inch Full Touch High Resolution IPS Display. Your message notifications will be displayed straight to your device screen. There are multiple watch faces to choose from, you can also customize the dial to show your personality.',
               stock: 5, price: 2999.0, thumbnail: 'https://rukminim1.flixcart.com/image/832/832/xif0q/smartwatch/a/f/z/-original-imaghudxz5cjuugy.jpeg?q=70', category: Category.last)
Product.create(name: 'boAt Storm Pro',
               title: 'The boAt Storm Pro Call is the perfect companion for your fitness transformation and is here to make life easy. Your Storm Pro Call will remove all obstructions that may come on your goal achieving path.', stock: 5, price: 3499.0, thumbnail: 'https://rukminim1.flixcart.com/image/832/832/xif0q/smartwatch/v/s/f/-original-imaghteut6shcwsz.jpeg?q=70', category: Category.last)
Product.create(name: 'Fire-Boltt Wonder',
               title: 'Fire-Boltt Wonder Smartwatch is a Bluetooth calling enabled wristwatch that comes with an inbuilt speaker and mic for HD calls and seamless music experience.', stock: 5, price: 3999.0, thumbnail: 'https://rukminim1.flixcart.com/image/832/832/l5h2xe80/smartwatch/u/2/z/1-8-bsw047-android-ios-fire-boltt-yes-original-imagg52h8cdmppbx.jpeg?q=70', category: Category.last)

#  address type
AddressType.destroy_all
AddressType.create(type: "Home", time: "7AM to 9PM")
AddressType.create(type: "Office", time: "10AM to 5PM")
AddressType.create(type: "Other", time: "8AM to 8PM")
