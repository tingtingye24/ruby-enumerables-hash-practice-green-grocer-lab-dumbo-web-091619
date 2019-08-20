def consolidate_cart(cart)
  # code here
  newhash = Hash.new
  cart.each do |value| 
    #newitem = text.scan(/"([^"]*)"/)
    if newhash[value.keys[0]]
      newhash[value.keys[0]][:count]+=1 
    else
      newhash[value.keys[0]] = {
        :price => value.values[0][:price],
        :clearance => value.values[0][:clearance],
        :count => 1
      }
    end
end
 return newhash
end


def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
  if cart.keys.include?(coupon[:item])
    if cart[coupon[:item]][:count] >= coupon[:num]
      withCoupon = "#{coupon[:item]} W/COUPON"
      if cart[withCoupon]
        cart[withCoupon][:count]+=coupon[:num]
      else 
        cart[withCoupon] = {
          :price => coupon[:cost]/coupon[:num],
          :clearance => cart[coupon[:item]][:clearance],
          :count => coupon[:num]
        }
      end
      cart[coupon[:item]][:count]-=coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |value|
    if value[:clearance]
      cart[value][:price] = (value[:price]* 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
