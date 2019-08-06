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

# cart {
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 3}
# }
# coupons [{:item => "AVOCADO", :num => 2, :cost => 5.00}]

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
        result[item_name][:count] = result[item_name][:count] - coupon[:num]
      else
        result[item_name+" W/COUPON"][:count] += coupon[:num]
      end 
    end 
  end 
  result
  # binding.pry
end

# result{
#   "AVOCADO" => {:price => 3.00, :clearance => true, :count => 1},
#   "AVOCADO W/COUPON" => {:price => 2.50, :clearance => true, :count => 2},
# }

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
