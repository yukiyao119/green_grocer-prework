require "pry"

def consolidate_cart(cart)
  new_cart = cart.uniq
  result = {}
  new_cart.collect do |item_hash|
    item_quan = cart.count(item_hash)
    item_hash.collect do |item, details|
    result[item] = details
    result[item][:count] = item_quan
    # binding.pry
    end
  end
  result
  # binding.pry
end

def apply_coupons(cart, coupons)
  result = cart
  coupons.each do |coupon|
    item_name = coupon[:item]   # "AVOCADO"
    if cart.keys.include?(item_name) && cart[item_name][:count] >= coupon[:num]
      if result[item_name+" W/COUPON"].nil?
        result[item_name+" W/COUPON"] = {
          :price => (coupon[:cost] / coupon[:num]),
          :clearance => cart[item_name][:clearance],
          :count => coupon[:num]
        }
        result[item_name][:count] -= coupon[:num]
      else
        result[item_name+" W/COUPON"][:count] += coupon[:num]
        result[item_name][:count] -= coupon[:num]
      end 
    end 
  end 
  result
  # binding.pry
end

# cart {
#   "PEANUT BUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
#   "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
#   "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
# }

def apply_clearance(cart)
  # code here
  result = cart 
  cart.each do |item, details|
    if details[:clearance] == true
      result[item][:price] = (0.8 * result[item][:price]).round(2)
    end 
  end 
  result
end

# new cart {
#   "PEANUT BUTTER" => {:price => 2.40, :clearance => true,  :count => 2},
#   "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
#   "SOY MILK"     => {:price => 3.60, :clearance => true,  :count => 1}
# }

def checkout(cart, coupons)
  # code here
end
