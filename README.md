# Teachable API Gem

## Teachable::Session

### `.register(options)`
  
 `register` registers a new user and returns a new session for that user

 options:
 * email (required)
 * password (required)
 * password_confirmation (required)
 * name
 * nickname
 * image


### `.login(options)`
  
 `login` logs in an exiting user and returns a new session for that user

  options:
  * email (required)
  * password (required)

### `#list_orders`
  
 `list_orders` returns an array of `Teachable::Orders` belonging to the current user

### `#create_order(options)`
  
 `create_order` creates an order for the current user

  options:
  * number (required)
  * total (required)
  * total_quantity (required)
  * email (required)
  * special instructions

