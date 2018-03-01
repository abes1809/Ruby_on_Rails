json.id @recipe.id
json.title @recipe.title
json.chef @recipe.user.name
json.ingredients @recipe.ingredients_list
json.directions @recipe.directions_list
json.created_at @recipe.friendly_created_at
json.prep_time @recipe.friendly_prep_time