connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: lookml_test_test_fun_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookml_test_test_fun_default_datagroup

explore: users {}

# - explore: events
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${events.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: inventory_items
#   joins:
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one


# - explore: order_items
#   joins:
#     - join: inventory_items
#       type: left_outer
#       sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
#       relationship: many_to_one

#     - join: orders
#       type: left_outer
#       sql_on: ${order_items.order_id} = ${orders.id}
#       relationship: many_to_one

#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one

#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: orders
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: products

# - explore: schema_migrations

# - explore: user_data
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${user_data.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: users_nn
