# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

todo = Todos.create([{title:"todo01", descrip:"this is todo01"}, 
					 {title:"todo02", descrip:"this is todo02"}])
Items.create([{name:"item01", todo:todo.find(params[:id])}, 
			  {name:"item02", todo:todo.find(params[:id])}])

